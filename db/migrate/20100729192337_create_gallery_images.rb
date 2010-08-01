class CreateGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :gallery_images do |t|
      t.references :gallery
      t.column :file_file_name, :string
      t.column :file_content_type, :string
      t.column :file_file_size, :integer
      t.column :file_updated_at, :datetime
      t.column :title, :string
      t.column :position, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_images
  end
end
