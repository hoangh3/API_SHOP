class CreateTransportStates < ActiveRecord::Migration[5.0]
  def change
    create_table :transport_states do |t|
      t.integer :status

      t.timestamps
    end
  end
end
