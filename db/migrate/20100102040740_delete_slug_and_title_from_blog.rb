class DeleteSlugAndTitleFromBlog < ActiveRecord::Migration
  def self.up
      remove_column :blogs, :slug
      remove_column :blogs, :title
  end

  def self.down
      add_column :blogs, :slug, :string
      add_column :blogs, :title, :string
  end
end
