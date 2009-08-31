class AddProperFieldsForEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :location
    add_column :events, :street, :string
    add_column :events, :town, :string
    add_column :events, :county, :string
    add_column :events, :post_code, :string
  end

  def self.down
    remove_column :events, :post_code
    remove_column :events, :county
    remove_column :events, :town
    remove_column :events, :street
    add_column :events, :location, :string
  end
end
