class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.boolean :active
      t.string :workflow_type

      t.timestamps
    end
  end
end
