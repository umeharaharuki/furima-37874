FactoryBot.define do
  factory :item do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '0a0a0a' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'タナカ' }
    birthday              { '1931-03-03' }
  end
end
