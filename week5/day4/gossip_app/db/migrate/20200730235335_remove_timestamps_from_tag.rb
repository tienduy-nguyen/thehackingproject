class RemoveTimestampsFromTag < ActiveRecord::Migration[5.2]
  def up
    remove_column :tags, :created_at, :string
    remove_column :tags, :updated_at, :string
    remove_column :likes, :created_at, :string
    remove_column :likes, :updated_at, :string
    remove_column :cities, :created_at, :string
    remove_column :cities, :updated_at, :string
  end
end
