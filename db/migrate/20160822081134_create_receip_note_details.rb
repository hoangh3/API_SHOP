class CreateReceipNoteDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :receip_note_details do |t|
      t.belongs_to :receip_note,      index: true
      t.belongs_to :product,          index: true

      t.integer :quantity
      t.float :price
      t.datetime :delete_at

      t.timestamps
    end
  end
end
