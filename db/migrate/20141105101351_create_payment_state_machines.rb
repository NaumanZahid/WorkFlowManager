class CreatePaymentStateMachines < ActiveRecord::Migration
  def change
    create_table :payment_state_machines do |t|

      t.timestamps
    end
  end
end
