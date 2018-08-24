class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :password_digest
      t.test :photo_url
      t.timestamps
    end
  end
end
