class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :zip_code, :integer
    add_column :users, :address, :text
    add_column :users, :phone_number, :integer
    add_column :users, :deleted_at, :string
  end
end
