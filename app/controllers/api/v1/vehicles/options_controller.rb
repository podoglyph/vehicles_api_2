class Api::V1::Vehicles::OptionsController < ApplicationController

  def index
    render json: Vehicle.find(params[:id]).options
  end

end
