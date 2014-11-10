class TasksStates < ActiveRecord::Migration
  def change
    create_table :states_tasks, id:false do |t|
      t.references :task
      t.references :state

      t.timestamps
    end
  end
end
