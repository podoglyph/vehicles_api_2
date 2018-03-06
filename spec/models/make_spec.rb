require 'rails_helper'

describe Make, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:country)}
  end
end
