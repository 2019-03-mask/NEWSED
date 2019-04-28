class RemoveDeliveryIdFromPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchase_histories, :DeliveryId, :integer
  end
end
