class NotesController < ApplicationController
  def notes
    @_notes ||= Note.all
  end

  def note
    @_note ||= notes.find(params[:id])
  end

  helper_method :notes, :note
end
