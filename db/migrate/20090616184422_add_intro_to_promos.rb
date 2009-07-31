class AddIntroToPromos < ActiveRecord::Migration
  def self.up
    add_column :promos, :intro, :text
  end

  def self.down
    remove_column :promos, :intro
  end
end
