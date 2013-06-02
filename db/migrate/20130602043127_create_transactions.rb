class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :message_id, null: false
      t.integer :from_user, null: false
      t.integer :to_user, null: false
      t.string :status, null: false
      t.decimal :amount_in_btc, null: false

      t.timestamps
    end
  end
end
