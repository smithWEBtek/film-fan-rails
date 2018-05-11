class MoviesController < ApplicationController
  

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movie.build_genre
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    current_user.watched_movies << @movie
    @movie.update(user_id: current_user.id, user_watched: current_user.id, inventory: 2)
    if @movie.save
      redirect_to directory_path(current_user.id), flash: {success: "'#{@movie.title}' was added!"}
    else
      flash.now[:error] = "Please enter all fields"
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comments = @movie.comments
    @comment = Comment.new
    
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movie_path(@movie), flash: {success: "#{@movie.title} was updated"}
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    flash[:success] = "#{@movie.title} has been deleted."
    redirect_to directory_path(current_user.id)
  end

  def favorite
    @movie = Movie.find(params[:id])
    @movie.user_id = current_user.id
    @movie.favorite
    flash[:success] = "Movie added to your favorites!"

    redirect_to directory_path(current_user.id)
  end

 

  private


    def movie_params
      params.require(:movie).permit(:title, :year, :description, :director, :genre_id, :genres_attributes => [:id, :name, :_destroy])
    end


end
