class AddIndexToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :supplier, foreign_key: true
  end
end
