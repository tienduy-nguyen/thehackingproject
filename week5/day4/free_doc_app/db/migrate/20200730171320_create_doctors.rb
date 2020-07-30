class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :patient, index:true
      t.datetime :date
      t.timestamps
    end
  end
end
