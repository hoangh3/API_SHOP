class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :category,             index: true
      t.belongs_to :producer,             index: true
      t.belongs_to :sex,                  index: true
      t.string :name
      t.float :price
      t.integer :quantity
      t.integer :cash_discount
      t.string :image
      t.string :title
      t.string :color
      t.string :size
      t.string :designed
      t.string :content
      t.string :order_information
      t.datetime :delete_at

      t.timestamps
    end
  end
end
