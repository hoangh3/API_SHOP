class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.belongs_to :customer,     index: true
      t.belongs_to :product,      index: true

      t.string :email
      t.boolean :state
      t.datetime :delete_at

      t.timestamps
    end
  end
end
