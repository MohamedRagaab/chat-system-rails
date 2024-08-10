class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :application, foreign_key: true, null: false
      t.bigint :number, null: false
      t.bigint :messages_count, default: 0

      t.timestamps
    end

    add_index :chats, [:application_id, :number], unique: true
  end
end
