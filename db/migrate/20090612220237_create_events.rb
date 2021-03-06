class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :title, :string
      t.column :start, :datetime
      t.column :finish, :datetime
      t.column :intro, :string
      t.column :body, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
