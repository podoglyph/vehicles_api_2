require "rails_helper"

describe "Make API" do

  context "when performing standard CRUD functions" do

    before(:all) do
      @makes = create_list(:make, 10)
      @m1 = Make.first
      @m2 = Make.last
    end

    it "sends a list of all makes" do
      get "/api/m1/makes"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)
      expect(json.first["id"]).to eq(@m1.id)
      expect(json.last["id"]).to eq(@m2.id)
    end

    it "send a single make" do
      get "/api/m1/makes/#{@m1.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["id"]).to eq(@m1.id)
    end

    it "can create a new make" do
      make_params = {name: "Cool Car Manufacturer", country: "America"}

      post "/api/m1/makes", params: {make: make_params}

      make = Make.last

      assert_response :success
      expect(response).to be_success
      expect(make["name"]).to eq("Cool Car Manufacturer")
      expect(make["country"]).to eq("America")
    end

    it "can update an existing make" do
      put "/api/m1/makes/#{@m1.id}", params: {make: {name: "Peugeot"}}

      new_make = Make.find(@m1.id)

      assert_response :success
      expect(response).to be_success
      expect(new_make.name).to eq("Peugeot")
    end

    it "can delete an existing make" do
      delete "/api/m1/makes/#{@m2.id}"

      assert_response :success
      expect(response).to be_success
      expect(Make.count).to eq(9)
    end

  end
end
