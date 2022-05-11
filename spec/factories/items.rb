FactoryBot.define do
  factory :item do
    product_name  { 'aaaaa' }
    explanation   { 'aaaaa' }
    category_id   { '2' }
    situation_id  { '2' }
    charge_id     { '2' }
    prefecture_id { '2' }
    ship_id       { '2' }
    price         { '350' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
