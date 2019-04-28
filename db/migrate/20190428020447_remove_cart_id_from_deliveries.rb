class RemoveCartIdFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :cart_id, :integer
  end
end
