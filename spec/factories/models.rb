FactoryBot.define do
  factory :model do
    sequence(:name) { |n| "Model #{n}"}
    base_price {Faker::Number.number(5)}
    style ["sedan", "pickup", "suv"].sample
    make
  end
end
