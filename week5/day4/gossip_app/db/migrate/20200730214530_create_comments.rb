class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :gossip_id
      t.text :content
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :gossip_id
  end
end
