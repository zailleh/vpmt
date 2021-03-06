class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :breed
      t.string :animal_type
      
      t.bigint :customer_id

      t.timestamps
    end
  end
end
