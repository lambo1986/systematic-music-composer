class SongsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end

  def show
    @user = User.find(params[:user_id])
    @song = Song.find(params[:id])
  end
end
