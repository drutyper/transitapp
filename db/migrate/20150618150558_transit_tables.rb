class TransitTables < ActiveRecord::Migration
  def change
    create_table "stations" do |t|
      t.string "name"
      t.string "code"
      t.string "address"
      t.integer "longitude"
      t.integer "latitude"

  end
end
