class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :user_id
      t.bigint :gossip_id
      t.bigint :comment_id
    end

    add_index :likes, :user_id
    add_index :likes, :gossip_id
    add_index :likes, :comment_id
  end
end
