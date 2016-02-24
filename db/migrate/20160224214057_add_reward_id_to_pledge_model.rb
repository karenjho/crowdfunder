class AddRewardIdToPledgeModel < ActiveRecord::Migration
  def change
    add_column :pledges, :reward_id, :integer
    add_index :pledges, :reward_id

    remove_column :pledges, :project_id, :integer
  end
end
