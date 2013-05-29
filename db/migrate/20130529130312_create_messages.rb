class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id
      t.string :sender
      t.string :sender_id
      t.text :content
      t.string :type
      t.text :full_message

      t.timestamps
    end
  end
end
