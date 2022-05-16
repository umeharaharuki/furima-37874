class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building, :telephone, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は例文のように入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "が空です" }
    validates :municipality
    validates :house_number
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'が不正です' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                           house_number: house_number, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end
