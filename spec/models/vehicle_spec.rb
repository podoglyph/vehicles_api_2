describe Vehicle, type: model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:nickname)}
    it {should validate_presence_of(:color)}
    it {should validate_presence_of(:mileage)}
  end
end
