require "rails_helper"

describe "Vehicle API" do

  context "when performing standard CRUD functions" do
    attr_reader :make, :model

    before(:all) do
      @make = create(:make)
      @model = create(:model, make_id: make.id)
      @vehicles = create_list(:vehicle, 10, make_id: make.id, model_id: model.id)
      @v1 = Vehicle.first
      @v2 = Vehicle.last
    end

    it "sends a list of all vehicles" do
      get "/api/v1/vehicles"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)
      expect(json.first["id"]).to eq(@v1.id)
      expect(json.last["id"]).to eq(@v2.id)
    end

    it "send a single vehicle" do
      get "/api/v1/vehicles/#{@v1.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["id"]).to eq(@v1.id)
    end

    it "can create a new vehicle" do
      vehicle_params = {nickname: "Cool Car", color: "red", mileage: 22000, price:19999, make_id: make.id, model_id: model.id}

      post "/api/v1/vehicles", params: {vehicle: vehicle_params}

      vehicle = Vehicle.last

      assert_response :success
      expect(response).to be_success
      expect(vehicle["nickname"]).to eq("Cool Car")
      expect(vehicle["color"]).to eq("red")
      expect(vehicle["mileage"]).to eq(22000)
      expect(vehicle["price"]).to eq(19999)
    end

    it "can update an existing vehicle" do
      put "/api/v1/vehicles/#{@v1.id}", params: {vehicle: {nickname: "Patty"}}

      new_vehicle = Vehicle.find(@v1.id)

      assert_response :success
      expect(response).to be_success
      expect(new_vehicle.nickname).to eq("Patty")
    end

    it "can delete an existing vehicle" do
      delete "/api/v1/vehicles/#{@v2.id}"

      assert_response :success
      expect(response).to be_success
      expect(Vehicle.count).to eq(9)
    end

  end
end
