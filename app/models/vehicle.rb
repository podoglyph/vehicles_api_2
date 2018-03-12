class Vehicle < ApplicationRecord
  validates :nickname, :color, :mileage, :price, presence: true

  has_many :vehicle_options
  has_many :options, through: :vehicle_options

  belongs_to :make
  belongs_to :model

  def self.least_mileage
    Vehicle.order("mileage ASC").limit(10)
  end

  def self.most_expensive
    Vehicle.order("price DESC").limit(10)
  end

  def self.least_expensive
    Vehicle.order("price ASC").limit(10)
  end

end
