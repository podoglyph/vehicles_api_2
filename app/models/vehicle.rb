class Vehicle < ApplicationRecord
  validates :nickname, :color, :mileage, presence: true

  has_many :vehicle_options
end
