class AddPrimalToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :ate_primal, :boolean
  end

  def self.down
    remove_column :blogs, :ate_primal
  end
end
