class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :when
      t.text :reason

      t.bigint :staff_id
      t.bigint :patient_id
      t.bigint :admission_id
      t.bigint :customer_id

      t.timestamps
    end
  end
end
