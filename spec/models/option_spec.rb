require 'rails_helper'

describe Option, type: :model do
  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:cost) }
  end

  describe "ActiveRecord associations" do
    it { should have_many(:vehicle_options) }
  end
end
