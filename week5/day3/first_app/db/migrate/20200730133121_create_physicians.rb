class CreatePhysicians < ActiveRecord::Migration[5.2]
  def change
    create_table :physicians do |t|
      t.string :name
      t.timestamps
    end
    create_table :patients do |t|
      t.string :name
      t.timestamps
    end

    create_table :appointements do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.datetime :appointement_date
      t.timestamps
    end
  end
end
