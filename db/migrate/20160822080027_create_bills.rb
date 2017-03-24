class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.belongs_to :customer,                 index: true
      t.belongs_to :transport_state,          index: true

      t.datetime :date
      t.integer :cash_discount
      t.boolean :state
      t.datetime :delete_at

      t.timestamps
    end
  end
end
