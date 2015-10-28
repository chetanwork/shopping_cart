class CreateProductLocations < ActiveRecord::Migration
  def change
    create_table :product_locations do |t|
      t.string :location
      t.float :tax_rates
      t.string :product_categories

      t.timestamps null: false
    end
  end
end
