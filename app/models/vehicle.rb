class Vehicle < ApplicationRecord
  validates :nickname, :color, :mileage, presence: true
  
end
