class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :zip_code
    end
    create_table :specialties do |t|
      t.string :name
      t.timestamps
    end
    create_table :doctors_specialties, id: false do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true
    end
    
    add_reference :doctors, :city, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key: true
  end
end
