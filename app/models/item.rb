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
    validates :price
    validates :image
end

  with_options numericality: { other_than: 1 } do
  validates :category_id
    validates :situation_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_id
end
end
