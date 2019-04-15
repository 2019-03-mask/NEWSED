class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :cart_item
      t.text :delivery_address
      t.integer :delivery_zip_code
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
