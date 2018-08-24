class CreateTprs < ActiveRecord::Migration[5.2]
  def change
    create_table :tprs do |t|

      t.timestamps
    end
  end
end
