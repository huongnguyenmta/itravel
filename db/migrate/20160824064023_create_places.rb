class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.string :description
      t.integer :town_id

      t.timestamps
    end
  end
end
