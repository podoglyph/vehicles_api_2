FactoryBot.define do
  factory :vehicle do
    sequence(:nickname) { |n| "Cool Car #{n}"}
    color %w(white black green red purple orange blue yellow).sample
    mileage {Faker::Number.number(5)}
  end
end
