class ChangeStateColumnInBill < ActiveRecord::Migration[5.0]
  def change
    rename_column :bills, :state, :payment_state
  end
end
