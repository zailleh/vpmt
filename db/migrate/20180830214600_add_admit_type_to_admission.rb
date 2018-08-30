class AddAdmitTypeToAdmission < ActiveRecord::Migration[5.2]
  def change
    add_column :admissions, :admit_type_id, :bigint
  end
end
