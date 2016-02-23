class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :threshold
      t.integer :quantity
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
