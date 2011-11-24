class CreateTempImages < ActiveRecord::Migration
  def self.up
    create_table :temp_images do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :temp_images
  end
end
