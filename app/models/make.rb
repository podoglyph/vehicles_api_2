class Make < ApplicationRecord
  validates :name, :country, presence: true

  has_many :models
  
end
