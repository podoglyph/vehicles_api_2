require "rails_helper"

describe VehicleOption, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:option_id)}
    it {should validate_presence_of(:vehicle_id)}
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:vehicle) }
    it { should belong_to(:option) }
  end

end
