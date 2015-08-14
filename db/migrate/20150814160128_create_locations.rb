class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :users
      t.string   :address
      t.float    :latitude
      t.float    :longitude
      t.timestamps null: false
    end
  end
end
