class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id
      t.string :sender_id
      t.string :sender
      t.text :content

      t.timestamps
    end
  end
end
