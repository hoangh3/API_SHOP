class CreateBillDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_details do |t|
      t.belongs_to :bill,         index: true
      t.belongs_to :product,      index: true
      t.integer :quantity
      t.datetime :delete_at

      t.timestamps
    end
  end
end
