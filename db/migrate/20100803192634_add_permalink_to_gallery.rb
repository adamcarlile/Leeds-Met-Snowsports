class AddPermalinkToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :permalink, :string
    add_index :galleries, :permalink
  end

  def self.down
    remove_index :galleries, :permalink
    remove_column :galleries, :permalink
  end
end
