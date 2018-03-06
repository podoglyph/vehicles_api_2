FactoryBot.define do
  factory :model do
    sequence(:name) { |n| "Model #{n}"}
    base_price {Faker::Number.number(5)}
    style [0, 1, 2, 3].sample
  end
end
