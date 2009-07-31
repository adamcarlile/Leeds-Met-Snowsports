class AddLocationAndLongAndLat < ActiveRecord::Migration
  def self.up
    add_column :events, :location, :string
    add_column :events, :lng, :string
    add_column :events, :lat, :string 
  end

  def self.down
    remove_column :events, :lat
    remove_column :events, :lng
    remove_column :events, :column_name
  end
end
