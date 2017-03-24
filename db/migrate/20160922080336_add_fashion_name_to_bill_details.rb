class AddFashionNameToBillDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_details, :fashion_name, :string
  end
end
