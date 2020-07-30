class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.belongs_to :city, index: true
      t.string :name
      t.string :sex
      t.timestamps
    end
  end
end
