require 'rails_helper'

describe "Vehicles API" do

  context "when querying least mileage vehicles" do

    attr_reader :vehicles

    before(:all) do
      @vehicles = create_list(:vehicle, 12)

    end

    it "return the 10 vehicles with least mileage" do
      get "/api/v1/vehicles/least_mileage"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)

      expect(json.first["mileage"]).to be < json.last["mileage"]
    end
  end
end
