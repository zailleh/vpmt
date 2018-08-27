class AddImgUrlToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :img_url, :text
  end
end
