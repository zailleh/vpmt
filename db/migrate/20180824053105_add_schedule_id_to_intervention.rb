class AddScheduleIdToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :schedule_id, :bigint
  end
end
