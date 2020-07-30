class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.bigint :user_id
      t.string :title
      t.text :content
      t.timestamps
    end

    add_index :gossips, :user_id
  end
end
