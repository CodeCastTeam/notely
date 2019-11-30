class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    @note.user = current_user
    if @note.save
      redirect_to notes_path, notice: 'Note created!'
    else
      render :new
    end
  end

  def index
    @notes = current_user.notes # this fetches all the notes for the current_user
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note), notice: 'Note updated'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: 'Note deleted'
  end

  private

  def find_user_note
    @note = current_user.notes.find params[:id]
  end

  def note_params
    params.require(:note).permit(:title, :body_md, :tag_list)
  end

end
