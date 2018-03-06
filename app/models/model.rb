class Model < ApplicationRecord
  validates :name, :style, :base_price, presence: true

  belongs_to :make
  
  enum style: [:sedan, :pickup, :suv]
end
