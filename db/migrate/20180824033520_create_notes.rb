class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :details
      t.bigint :staff_id
      t.string :type ## used for STI

      t.timestamps
    end
  end
end
