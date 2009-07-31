class CreatePromos < ActiveRecord::Migration
  def self.up
    create_table :promos do |t|
      t.column :page_id, :integer
      t.column :title, :string
      t.column :override_url, :string      
      t.timestamps
    end
  end

  def self.down
    drop_table :promos
  end
end
