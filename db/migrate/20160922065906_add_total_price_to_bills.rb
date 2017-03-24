class AddTotalPriceToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :total_price, :float
  end
end
