class CreatePaymentTransitions < ActiveRecord::Migration
  def change
    create_table :payment_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :payment_id, null: false
      t.timestamps
    end

    add_index :payment_transitions, :payment_id
    add_index :payment_transitions, [:sort_key, :payment_id], unique: true
  end
end
