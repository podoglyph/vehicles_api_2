class Api::V1::Vehicles::LeastExpensiveController < ApplicationController

  def index
    render json: Vehicle.least_expensive
  end

end
