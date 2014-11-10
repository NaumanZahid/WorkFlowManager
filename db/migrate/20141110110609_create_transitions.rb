class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :from_state_id
      t.integer :to_state_id
      t.references :workflow
      t.integer :number

      t.timestamps
    end
  end
end
