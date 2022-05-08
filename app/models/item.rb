class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :category_id
    validates :situation_id
    validates :last_name_kana
    validates :birthday
end
