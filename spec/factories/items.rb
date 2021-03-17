FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    price {Faker::Number.non_zero_digit}
    category_id {Faker::Number.non_zero_digit}
    condition_id {Faker::Number.non_zero_digit}
    delivery_id {Faker::Number.non_zero_digit}
    prefecture_id {Faker::Number.non_zero_digit}
    shipping_date_id {Faker::Number.non_zero_digit}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
