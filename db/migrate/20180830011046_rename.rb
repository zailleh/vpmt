class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :appointment_status_id, :status_id
  end
end
