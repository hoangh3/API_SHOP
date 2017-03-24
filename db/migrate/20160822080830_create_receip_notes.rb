class CreateReceipNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :receip_notes do |t|
      t.datetime :delete_at

      t.timestamps
    end
  end
end
