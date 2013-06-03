class RemoveSenderIdFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :sender_id
  end

  def down
    add_column :messages, :sender_id, :string
  end
end
