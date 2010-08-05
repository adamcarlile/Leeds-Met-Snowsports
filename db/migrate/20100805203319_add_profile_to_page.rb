class AddProfileToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :profile_id, :string
  end

  def self.down
    remove_column :pages, :profile_id
  end
end
