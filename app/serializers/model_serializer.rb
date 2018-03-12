class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :style, :base_price, :make_id, :make

  def make
    Make.find(object.make_id).name
  end

end
