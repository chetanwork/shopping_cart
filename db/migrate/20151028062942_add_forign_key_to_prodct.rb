class AddForignKeyToProdct < ActiveRecord::Migration
  def change
  	add_column :products, :product_location_id, :integer
  end
end
