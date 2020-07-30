class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|

      t.timestamps
    end
  end
end
