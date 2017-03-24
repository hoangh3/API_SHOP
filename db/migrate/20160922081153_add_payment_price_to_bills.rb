class AddPaymentPriceToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :payment_price, :string
  end
end
