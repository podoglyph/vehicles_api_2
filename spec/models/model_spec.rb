require 'rails_helper'

describe Model, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:base_price)}
    it {should validate_presence_of(:style)}
  end
end
