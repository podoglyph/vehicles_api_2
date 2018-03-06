class Option < ApplicationRecord
  validates :name, :cost, presence: true
  validates_uniqueness_of :name

  
end
