require 'rails_helper'

describe "Vehicles API" do

  context "when querying most expensive vehicles" do

    attr_reader :vehicles

    before(:all) do
      @vehicles = create_list(:vehicle, 12)

    end

    it "return the 10 most expensive vehicles" do
      get "/api/v1/vehicles/most_expensive"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)

      expect(json.first["price"]).to be > json.last["price"]
    end
  end
end
