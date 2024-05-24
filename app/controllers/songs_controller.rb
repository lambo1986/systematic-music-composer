class SongsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end
end
