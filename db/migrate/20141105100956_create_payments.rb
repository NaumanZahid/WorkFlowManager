class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :cash
      t.string :status

      t.timestamps
    end
  end
end
