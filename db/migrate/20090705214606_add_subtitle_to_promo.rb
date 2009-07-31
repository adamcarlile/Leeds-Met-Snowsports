class AddSubtitleToPromo < ActiveRecord::Migration
  def self.up
    add_column :promos, :subtitle, :string
  end

  def self.down
    remove_column :promos, :subtitle
  end
end
