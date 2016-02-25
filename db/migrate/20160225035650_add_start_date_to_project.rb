class AddStartDateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :start_date, :datetime

    rename_column :projects, :deadline, :end_date
  end
end
