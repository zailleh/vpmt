class AddParentIdToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :parent_id, :bigint
  end
end
