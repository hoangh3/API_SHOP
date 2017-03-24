class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.belongs_to :customer,         index: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated
      t.string :activated_at
      t.string :datetime
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.datetime :delete_at

      t.timestamps
    end
  end
end
