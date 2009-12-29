class AddBlogIdToBodyPhoto < ActiveRecord::Migration
  def self.up
    add_column :body_photos, :blog_id, :integer
  end

  def self.down
    remove_column :body_photos, :blog_id
  end
end
