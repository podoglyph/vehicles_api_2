class Vehicle < ApplicationRecord
  validates :nickname, :color, :mileage, :price, presence: true

  has_many :vehicle_options
  has_many :options, through: :vehicle_options

  belongs_to :make
  belongs_to :model
end
