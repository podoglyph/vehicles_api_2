require "rails_helper"

describe "Model API" do

  context "when performing standard CRUD functions" do

    before(:all) do
      @models = create_list(:model, 10)
      @m1 = Model.first
      @m2 = Model.last
    end

    it "sends a list of all models" do
      get "/api/v1/models"

      json = JSON.parse(response.body)

      expect(json.length).to eq(10)
      expect(json.first["id"]).to eq(@m1.id)
      expect(json.last["id"]).to eq(@m2.id)
    end

    it "send a single model" do
      get "/api/v1/models/#{@m1.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["id"]).to eq(@m1.id)
    end

    it "can create a new model" do
      make = create(:make)

      model_params = {name: "3 Series", base_price: 22000, style: "sedan", make_id: make.id}

      post "/api/v1/models", params: {model: model_params}

      model = Model.last

      assert_response :success
      expect(response).to be_success
      expect(model["name"]).to eq("3 Series")
      expect(model["base_price"]).to eq(22000)
      expect(model["style"]).to eq("sedan")
    end

    it "can update an existing model" do
      put "/api/v1/models/#{@m1.id}", params: {model: {name: "8i"}}

      new_model = Model.find(@m1.id)

      assert_response :success
      expect(response).to be_success
      expect(new_model.name).to eq("8i")
    end

    it "can delete an existing model" do
      delete "/api/v1/models/#{@m2.id}"

      assert_response :success
      expect(response).to be_success
      expect(Model.count).to eq(9)
    end

  end
end
