class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :account_histories do |t|
      t.belongs_to :account
      t.integer :credit_rating
      t.timestamps
    end
  end
end
