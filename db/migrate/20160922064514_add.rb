class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_details, :size, :string
    add_column :bill_details, :color, :string
  end
end
