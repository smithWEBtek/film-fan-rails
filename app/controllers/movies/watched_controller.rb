class Movies::WatchedController < ApplicationController

  def index
    @movies = Movie.where(director_id: current_user.director_ids, user_owned: "Yes")
  end

end