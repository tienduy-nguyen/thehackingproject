class CreateOrgCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :org_companies do |t|
      t.string :name, null:false
      t.string :avatar
      t.text :description
      t.string :verification_doc
      t.boolean :verified
      t.belongs_to :type_company
      t.timestamps null:false
    end
  end
end
