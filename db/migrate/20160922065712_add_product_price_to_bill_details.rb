class AddProductPriceToBillDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_details, :product_price, :float
  end
end
