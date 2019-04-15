class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :item_name
      t.text :item_image
      t.string :item_states
      t.string :item_type
      t.integer :price
      t.integer :stock
      t.string :deleted_at
      t.integer :artist_id
      t.integer :lable_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
