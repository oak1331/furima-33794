FactoryBot.define do
  factory :order_address do
    postal_code = '123' + '-' + '1234'
    postal_code { postal_code }
    city { Faker::Lorem.sentence }
    street { Faker::Lorem.sentence }
    phone { Faker::Number.number(digits: 11) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
