require "rails_helper"

describe "Option API" do

  context "when performing standard CRUD functions" do

    before(:all) do
      @options = create_list(:option, 10)
      @o1 = Option.first
      @o2 = Option.last
    end

    it "sends a list of all options" do
      get "/api/v1/options"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)
      expect(json.first["id"]).to eq(@o1.id)
      expect(json.last["id"]).to eq(@o2.id)
    end

    it "send a single option" do
      get "/api/v1/options/#{@o1.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["id"]).to eq(@o1.id)
    end

    it "can create a new option" do
      option_params = {name: "Rearview Mirror", cost: 220}

      post "/api/v1/options", params: {option: option_params}

      option = Option.last

      assert_response :success
      expect(response).to be_success
      expect(option["name"]).to eq("Rearview Mirror")
      expect(option["cost"]).to eq(220)
    end

    it "can update an existing option" do
      put "/api/v1/options/#{@o1.id}", params: {option: {name: "Leather"}}

      new_option = Option.find(@o1.id)

      assert_response :success
      expect(response).to be_success
      expect(new_option.name).to eq("Leather")
    end

    it "can delete an existing option" do
      delete "/api/v1/options/#{@o2.id}"

      assert_response :success
      expect(response).to be_success
      expect(Option.count).to eq(9)
    end

  end
end
