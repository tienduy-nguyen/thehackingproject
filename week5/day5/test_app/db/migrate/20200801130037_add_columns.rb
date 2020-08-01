class AddColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :city_id, :bigint
    add_column :listings, :administrator_id, :bigint
    add_column :reservations, :listing_id, :bigint
    add_column :reservations, :guest_id, :bigint
    
    
    add_index :listings, :city_id
    add_index :listings, :administrator_id
    add_index :reservations, :listing_id
    add_index :reservations, :guest_id
  end
end
