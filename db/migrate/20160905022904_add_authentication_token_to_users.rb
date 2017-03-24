class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :authen_token_digest, :string
    add_index :users, :authen_token_digest
  end
end
