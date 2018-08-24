class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :suburb
      t.string :post_code
      t.string :phone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
