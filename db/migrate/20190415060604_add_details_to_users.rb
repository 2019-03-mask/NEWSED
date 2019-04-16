class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :address, :text
    add_column :users, :deleted_at, :string
  end
end
