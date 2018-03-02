class Directors::FavoritesController < ApplicationController

  def index
    @directors = current_user.directors.where(rating: 5).order(:name)
  end
  
end