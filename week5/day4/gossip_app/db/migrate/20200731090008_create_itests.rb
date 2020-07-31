class CreateItests < ActiveRecord::Migration[5.2]
  def change
    create_table :itests do |t|
      t.bigint :user_id
      t.bigint :gossip_id
      t.bigint :comment_id
    end

    add_index :itests, :user_id
    add_index :itests, :gossip_id
    add_index :itests, :comment_id
  end
end
