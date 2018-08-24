class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.text :reason
      t.bigint :staff_id
      t.bigint :patient_id
      t.bigint :appointment_id

      t.timestamps
    end
  end
end
