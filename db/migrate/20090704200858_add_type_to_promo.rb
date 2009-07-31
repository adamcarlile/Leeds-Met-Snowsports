class AddTypeToPromo < ActiveRecord::Migration
  def self.up
    add_column :promos, :location, :string
  end

  def self.down
    remove_column :promos, :location
  end
end
