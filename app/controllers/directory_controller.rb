
class DirectoryController < ApplicationController

  def show
      @my_directory = Directory.find_or_create_by(:user_id => current_user.id)
      
    if current_user.id == @my_directory.user_id
        @watched_movies = @my_directory.user.movies.watched
    else
        redirect_to root_path
    end
  end
end
