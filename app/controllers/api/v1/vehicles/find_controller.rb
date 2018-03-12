class Api::V1::Vehicles::FindController < ApplicationController

  def index
    render json: Vehicle.where(vehicle_params)
  end

  def show
    render json: Vehicle.find_by(vehicle_params)
  end

  private

  def vehicle_params
    check_params(params.permit(:color))
  end

  def check_params(params)
    params.each {|param, v| v.downcase! }
  end

end
