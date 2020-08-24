class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string "plan_id"
      t.integer "user_id"
      t.boolean "active", default: true
      t.datetime "current_period_ends_at"
      t.string "stripe_id"
      t.timestamps
    end
  end
end
