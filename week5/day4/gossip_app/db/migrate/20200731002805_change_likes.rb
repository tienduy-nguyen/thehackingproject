class ChangeLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :gossip_id, :bigint, optional: true
    change_column :likes, :comment_id, :bigint, optional: true
  end
end
