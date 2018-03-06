class AddMakeRefToModel < ActiveRecord::Migration[5.1]
  def change
    add_reference :models, :make, foreign_key: true
  end
end
