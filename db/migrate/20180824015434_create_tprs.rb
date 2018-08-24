class CreateTprs < ActiveRecord::Migration[5.2]
  def change
    create_table :tprs do |t|
      t.float :temperature
      t.float :resp_rate
      t.float :pulse

      t.bigint :admossion_id
      t.bigint :staff_id
      
      t.timestamps
    end
  end
end
