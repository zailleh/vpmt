class CreateAdmitTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :admit_types do |t|
      t.string :type_name
      t.timestamps
    end
  end
end
