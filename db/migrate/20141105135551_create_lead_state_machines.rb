class CreateLeadStateMachines < ActiveRecord::Migration
  def change
    create_table :lead_state_machines do |t|

      t.timestamps
    end
  end
end
