class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.text :delivery_state
      t.integer :cart_id

      t.timestamps
    end
  end
end
