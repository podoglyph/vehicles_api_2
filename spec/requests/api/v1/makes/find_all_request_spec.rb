require "rails_helper"

describe "Makes API" do

  context "when querying for a given make's models" do
    attr_reader :make1, :model1, :model2, :model3

    before(:all) do
      makes = create_list(:make, 2)
      @make1 = makes.first
      @model1 = create(:model, make_id: makes.first.id)
      @model2 = create(:model, make_id: makes.first.id)
      @model3 = create(:model, make_id: makes.last.id)
    end

    it "sends a collection of models for the make" do
      get "/api/v1/makes/#{make1.id}/find_models"

      json = JSON.parse(response.body)

      expect(json.length).to eq(2)

      expect(json.first["make_id"]).to eq(model1.make_id)
      expect(json.last["make_id"]).to eq(model1.make_id)
      
    end

  end
end
