class CreateTrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :trolls do |t|
      t.belongs_to :dogsitter, index: true
      t.belongs_to :dog, index: true
      t.belongs_to :city, index: true
      t.datetime :date
      t.timestamps
    end
  end
end
