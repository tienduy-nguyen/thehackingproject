class RefixTypeLikesTable < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :gossip_id, :bigint
    change_column :likes, :comment_id, :bigint
  end
end
