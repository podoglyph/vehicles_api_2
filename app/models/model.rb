class Model < ApplicationRecord
  validates :name, :style, :base_price, presence: true

  enum style: [:sedan, :pickup, :suv]
end
