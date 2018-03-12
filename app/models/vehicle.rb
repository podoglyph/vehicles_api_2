class Vehicle < ApplicationRecord
  validates :nickname, :color, :mileage, presence: true

  has_many :vehicle_options
  has_many :options, through: :vehicle_options
end
