class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :start
      
      t.bigint :staff_id
      t.bigint :admission_id

      t.timestamps
    end
  end
end
