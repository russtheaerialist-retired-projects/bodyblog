class AddOrgasmToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :orgasm, :boolean
  end

  def self.down
    remove_column :blogs, :orgasm
  end
end
