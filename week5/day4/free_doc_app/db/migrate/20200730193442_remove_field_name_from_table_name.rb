class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.2]
  def up
    remove_column :doctors, :zipcode, :string
    remove_column :doctors, :specialty, :string
  end
end
