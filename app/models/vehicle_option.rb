class VehicleOption < ApplicationRecord
  validates :option_id, :vehicle_id, presence: true
  
  belongs_to :vehicle
  belongs_to :option
end
