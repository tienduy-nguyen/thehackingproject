class ChangeTypeId < ActiveRecord::Migration[6.0]
  def change
    change_column :cities, :id, :integer
    change_column :users, :id, :integer
    change_column :listings, :id, :integer
    change_column :reservations, :id, :integer
  end
end
