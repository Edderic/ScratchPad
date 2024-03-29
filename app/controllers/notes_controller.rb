class NotesController < ApplicationController
  helper_method :notes, :note
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    respond_with notes
  end

  def create
    note = Note.new
    save_note(note)
    respond_with(note) do |format|
      format.json { render json: note }
    end
  end

  def update
    # note.update_attributes(note_params)
    save_note(note)
    respond_with(note) do |format|
      format.json { render json: note }
    end
  end

  def destroy
    respond_with note.destroy
  end

  private

  def note_params
    # params.permit(:title, :content)
    # a = params.slice(:title, :content)
    params.require(:note).permit(:title, :content)
    # binding.pry
  end


  def notes
    @_notes ||= Note.all
  end

  def note
    @_note ||= notes.find(params[:id])
  end

  def save_note(note)
    noteform = NoteForm.new(note, params)
    noteform.save
  end
end
