class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :name
      t.string :address
      t.string :phone
      t.string :country
      t.string :city
      t.float :total
      t.datetime :delete_at

      t.timestamps
    end
  end
end
