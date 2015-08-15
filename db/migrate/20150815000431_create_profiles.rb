class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :frequency
      t.string :area
      t.string :artists
      t.timestamps null: false
    end
  end
end
