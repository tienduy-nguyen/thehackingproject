class ChangeType < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :city_id, :integer
    change_column :listings, :administrator_id, :integer
    change_column :reservations, :listing_id, :integer
    change_column :reservations, :guest_id, :integer
    
  end
end
