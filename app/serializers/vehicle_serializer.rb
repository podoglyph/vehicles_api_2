class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :color, :mileage, :price, :make_id, :model_id, :make, :model, :options

  def make
    Make.find(object.make_id).name
  end

  def model
    Model.find(object.model_id).name
  end

  def options
    object.options
  end

end
