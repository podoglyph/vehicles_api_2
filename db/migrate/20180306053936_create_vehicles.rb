class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.string :color
      t.bigint :mileage

      t.timestamps
    end
  end
end
