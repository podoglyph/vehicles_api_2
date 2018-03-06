class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.string :name
      t.bigint :base_price
      t.integer :style

      t.timestamps
    end
  end
end
