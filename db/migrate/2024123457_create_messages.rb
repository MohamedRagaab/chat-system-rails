class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true, null: false
      t.bigint :number, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :messages, [:chat_id, :number], unique: true
  end
end
