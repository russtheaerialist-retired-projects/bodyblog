class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blog do |t|
      t.string :slug
      t.string :title
      t.text :body
      t.float :weight
      t.float :waist
      t.float :chest
      t.float :hips
      t.float :bodyfat
      t.float :calories_burned
      t.float :calories_eaten
      t.float :hours_slept

      t.timestamps
    end
  end

  def self.down
    drop_table :blog
  end
end
