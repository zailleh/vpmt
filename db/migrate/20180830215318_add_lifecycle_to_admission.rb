class AddLifecycleToAdmission < ActiveRecord::Migration[5.2]
  def change
    add_column :admissions, :admit_at, :datetime
    add_column :admissions, :discharge_at, :datetime
    add_column :admissions, :status_id, :bigint

    create_table :admit_statuses do |t|
      t.bigint :prev
      t.string :status
      t.bigint :next
    end
  end
end
