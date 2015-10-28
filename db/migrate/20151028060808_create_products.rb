class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.float :product_price
      t.string :product_categories

      t.timestamps null: false
    end
  end
end
