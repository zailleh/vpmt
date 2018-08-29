class CreateAppointmentStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_statuses do |t|
      t.string :status
    end

    add_column :appointments, :appointment_status_id, :bigint
  end
end
