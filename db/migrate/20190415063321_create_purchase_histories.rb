class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.integer :bought_price
      t.integer :cart_id
      t.integer :user_id

      t.timestamps
    end
  end
end
