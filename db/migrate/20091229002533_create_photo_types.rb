class CreatePhotoTypes < ActiveRecord::Migration
  def self.up
    create_table :photo_types do |t|
      t.string :name

      t.timestamps
    end

    PhotoType.new(:name=>"Front, Relaxed").save!
    PhotoType.new(:name=>"Back, Relaxed").save!
    PhotoType.new(:name=>"Front, Flexing").save!
    PhotoType.new(:name=>"Back, Flexing").save!
  end

  def self.down
    drop_table :photo_types
  end
end
