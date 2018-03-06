class Model < ApplicationRecord
  validates :name, :style, :base_price, presence: true
  
end
