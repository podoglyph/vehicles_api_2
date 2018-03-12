require "rails_helper"

describe "Vehicles API" do

  context "when adding params to find vehicles" do
    attr_reader :vehicle1, :vehicle2, :vehicle3

    before(:all) do
      @vehicle1 = create(:vehicle, color: "blue")
      @vehicle2 = create(:vehicle, color: "blue")
      @vehicle3 = create(:vehicle, color: "red")
    end

    it "sends a list of the vehicles with given color" do
      get "/api/v1/vehicles/find_all?color=Blue"

      json = JSON.parse(response.body)

      expect(json.length).to eq(2)

      expect(json.first["id"]).to eq(vehicle1.id)
      expect(json.first["nickname"]).to eq(vehicle1.nickname)
      expect(json.first["color"]).to eq(vehicle1.color)

      expect(json.last["id"]).to eq(vehicle2.id)
      expect(json.last["nickname"]).to eq(vehicle2.nickname)
      expect(json.last["color"]).to eq(vehicle2.color)

    end

  end
end
