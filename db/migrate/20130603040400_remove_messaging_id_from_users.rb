class RemoveMessagingIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :messaging_id
  end

  def down
    add_column :users, :messaging_id, :string
  end
end
