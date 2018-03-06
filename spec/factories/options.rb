FactoryBot.define do
  factory :option do
    sequence(:name) { |n| "Sweet Add On #{n}"}
    cost {Faker::Number.number(3)}
  end
end
