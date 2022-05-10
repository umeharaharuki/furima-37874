class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_id
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_id
  end
end
