class Model < ApplicationRecord
  validates :name, :style, :base_price, presence: true
  validates_uniqueness_of :name

  belongs_to :make

  enum style: [:sedan, :pickup, :suv]
end
