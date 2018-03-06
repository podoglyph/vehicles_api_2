class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.bigint :cost

      t.timestamps
    end
  end
end
