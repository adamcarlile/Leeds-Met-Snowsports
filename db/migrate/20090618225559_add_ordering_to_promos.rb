class AddOrderingToPromos < ActiveRecord::Migration
  def self.up
    add_column :promos, :position, :integer
  end

  def self.down
    remove_column :promos, :position
  end
end
