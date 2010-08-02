class AddPermalinkToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :permalink, :string
    add_index :events, :permalink
  end

  def self.down
    remove_index :events, :permalink
    remove_column :events, :permalink
  end
end
