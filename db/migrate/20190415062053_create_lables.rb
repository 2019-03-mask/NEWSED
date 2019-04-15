class CreateLables < ActiveRecord::Migration[5.2]
  def change
    create_table :lables do |t|
      t.text :lable_name

      t.timestamps
    end
  end
end
