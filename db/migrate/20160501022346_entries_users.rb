class EntriesUsers < ActiveRecord::Migration
  def change
    create_table :entries_users, id: false do |t|
      t.integer :entry_id
      t.integer :user_id
    end

    add_index :entries_users, [:entry_id, :user_id]
  end
end
