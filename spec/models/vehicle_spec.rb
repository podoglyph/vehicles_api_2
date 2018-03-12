require "rails_helper"

describe Vehicle, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:nickname)}
    it {should validate_presence_of(:color)}
    it {should validate_presence_of(:mileage)}
  end

  describe "ActiveRecord associations" do
    it { should have_many(:vehicle_options) }
    it { should have_many(:options).through(:vehicle_options) }
  end

end
