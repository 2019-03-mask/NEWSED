class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review_title
      t.text :review_text
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
