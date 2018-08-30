class AddNextPrevColumnToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_statuses, :next, :string
    add_column :appointment_statuses, :prev, :string
  end
end
