FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    municipality  { 'a' }
    house_number  { 'a' }
    telephone     { '09012345678' }
    building      { 'a' }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end