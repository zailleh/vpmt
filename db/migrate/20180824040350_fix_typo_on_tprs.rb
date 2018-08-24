class FixTypoOnTprs < ActiveRecord::Migration[5.2]
  def change
    rename_column :tprs, :admossion_id, :admission_id
  end
end
