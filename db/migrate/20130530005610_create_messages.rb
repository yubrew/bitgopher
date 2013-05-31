class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id, null: false
      t.string :sender, null: false
      t.string :sender_id, null: false
      t.text :content, null: false
      t.string :type, null: false
      t.text :full_message, null: false
      t.boolean :parsed, default: false

      t.timestamps
    end
  end
end
