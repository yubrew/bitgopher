class FixColumnNames < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.rename :from_user, :from_user_id
      t.rename :to_user, :to_user_id
    end
    change_column :transactions, :to_user_id, :integer, null: true
  end
  def self.down
    change_table :transactions do |t|
      t.rename :from_user_id, :from_user
      t.rename :to_user_id, :to_user
    end
    change_column :transactions, :to_user, :integer, null: false
  end

end
