class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.bigint :recipient_id
      t.bigint :sender_id
      t.text :content
      t.timestamps
    end

    add_index :private_messages, :recipient_id
    add_index :private_messages, :sender_id
  end
end
