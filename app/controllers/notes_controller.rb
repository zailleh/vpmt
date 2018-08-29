class NotesController < ApplicationController
  def create
    note = Note.new note_params

    record_save note
  end

  private
    def note_params
      params.require(:note).permit(:staff_id, :details, :parent_id, :takes_notes_type)
    end
end
