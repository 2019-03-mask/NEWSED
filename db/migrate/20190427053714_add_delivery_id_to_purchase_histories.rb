class AddDeliveryIdToPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :delivery_id, :integer
  end
end
