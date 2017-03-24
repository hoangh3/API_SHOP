class CreateProducers < ActiveRecord::Migration[5.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.datetime :delete_at

      t.timestamps
    end
  end
end
