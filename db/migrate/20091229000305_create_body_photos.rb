class CreateBodyPhotos < ActiveRecord::Migration
  def self.up
    create_table :body_photos do |t|
      t.integer :photo_type_id
      t.boolean :public

      t.timestamps
    end
  end

  def self.down
    drop_table :body_photos
  end
end
