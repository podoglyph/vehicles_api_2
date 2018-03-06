FactoryBot.define do
  factory :make do
    sequence(:name) { |n| "Manufacturer #{n}"}
    country %w(America Britain Germany France Japan China Mexico).sample
  end
end
