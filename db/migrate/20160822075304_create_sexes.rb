class CreateSexes < ActiveRecord::Migration[5.0]
  def change
    create_table :sexes do |t|
      t.string :gender
      t.datetime :delete_at

      t.timestamps
    end
  end
end
