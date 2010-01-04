class AddShavedAndExercisedToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :shaved, :boolean
    add_column :blogs, :exercised, :boolean
  end

  def self.down
    remove_column :blogs, :exercised
    remove_column :blogs, :shaved
  end
end
