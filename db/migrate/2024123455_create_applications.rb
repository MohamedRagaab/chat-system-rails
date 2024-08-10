class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :token, unique: true, null: false
      t.string :name, null: false
      t.bigint :chats_count, default: 0

      t.timestamps
    end

    add_index :applications, :token, unique: true
  end
end
