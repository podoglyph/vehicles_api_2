require "rails_helper"

describe Vehicle, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:nickname)}
    it {should validate_presence_of(:color)}
    it {should validate_presence_of(:mileage)}
    it {should validate_presence_of(:price)}
  end

  describe "ActiveRecord associations" do
    it { should have_many(:vehicle_options) }
    it { should have_many(:options).through(:vehicle_options) }
    it { should belong_to(:make)}
    it { should belong_to(:model)}
  end

end
