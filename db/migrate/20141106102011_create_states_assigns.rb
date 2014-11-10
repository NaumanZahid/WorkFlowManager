class CreateStatesAssigns < ActiveRecord::Migration
  def change
    create_table :states_assigns do |t|
      t.string :assigned_to
      t.references :state

      t.timestamps
    end
  end
end
