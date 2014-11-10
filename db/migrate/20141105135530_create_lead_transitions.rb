class CreateLeadTransitions < ActiveRecord::Migration
  def change
    create_table :lead_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :lead_id, null: false
      t.timestamps
    end

    add_index :lead_transitions, :lead_id
    add_index :lead_transitions, [:sort_key, :lead_id], unique: true
  end
end
