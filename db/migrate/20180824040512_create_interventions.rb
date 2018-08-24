class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.text :description
      
      t.bigint :admission_id
      t.bigint :appointment_id
      t.bigint :staff_id

      t.timestamps
    end
  end
end
