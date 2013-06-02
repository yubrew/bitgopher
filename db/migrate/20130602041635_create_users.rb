class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :messaging_id
      t.decimal :balance
      t.string :btc_address
      t.boolean :confirmed

      t.timestamps
    end
  end
end
