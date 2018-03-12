require "rails_helper"

describe "Model API" do

  context "when requesting options for a given vehicle" do
    attr_reader :vehicle, :opt1, :opt3

    before(:all) do
      @vehicle = create(:vehicle)
      options = create_list(:option, 3)

      @opt1 = options.first
      @opt3 = options.last

      vehicle.options << options
    end

    it "sends a list of the vehicle's options" do
      get "/api/v1/vehicles/#{vehicle.id}/options"

      json = JSON.parse(response.body)

      expect(json.length).to eq(3)
      expect(json.first["id"]).to eq(opt1.id)
      expect(json.first["name"]).to eq(opt1.name)
      expect(json.first["cost"]).to eq(opt1.cost)

      expect(json.last["id"]).to eq(opt3.id)
      expect(json.last["name"]).to eq(opt3.name)
      expect(json.last["cost"]).to eq(opt3.cost)

    end

  end
end
