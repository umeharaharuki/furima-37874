class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_id
    validates :price
    validates :image
end

has_one_attached :image
belongs_to :user
end
