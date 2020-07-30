class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end
    create_table :gossips_tags , id: false do |t|
      t.bigint :gossip_id
      t.bigint :tag_id
    end

    add_index :gossips_tags, :gossip_id
    add_index :gossips_tags, :tag_id

  end
end
