class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :message_id
      t.string :from_user_handle
      t.string :to_user_handle
      t.string :status
      t.string :amount_in_btc

      t.timestamps
    end
  end
end
