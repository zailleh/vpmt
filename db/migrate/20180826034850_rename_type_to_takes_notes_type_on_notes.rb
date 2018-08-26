class RenameTypeToTakesNotesTypeOnNotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :type, :takes_notes_type
  end
end
