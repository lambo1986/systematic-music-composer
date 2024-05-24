class SongsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end

  def show
    @user = User.find(params[:user_id])
    @song = Song.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @song = @user.songs.new
  end

  def create
    @user = User.find(params[:user_id])
    @song = @user.songs.build(songs_params)
    if @song.save
      redirect_to user_songs_path(@user), notice: "Song successfully created!"
    else
      flash.now[:alert] = "Failed to create song. Please fill in all required fields."
      render :new
    end
  end

  private

  def songs_params
    params.require(:song).permit(:title, :genre, :vibe, :description, :lyrics, :tempo, :form, :instrumentation)
  end
end
