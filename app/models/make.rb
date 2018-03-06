class Make < ApplicationRecord
  validates :name, :country, presence: true
  
end
