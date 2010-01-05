class CreateInsanityFitTestResults < ActiveRecord::Migration
  def self.up
    create_table :insanity_fit_test_results do |t|
      t.integer :switch_kicks
      t.integer :power_jacks
      t.integer :power_knees
      t.integer :globe_jumps
      t.integer :suicide_jumps
      t.interger :push_up_jacks
      t.integer :low_plank_obliques

      t.timestamps
    end
  end

  def self.down
    drop_table :insanity_fit_test_results
  end
end
