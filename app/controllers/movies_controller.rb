class MoviesController < ApplicationController
   before_action :set_movie, only: [:show, :edit, :update, :destroy]
   before_action :find_the_director

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    
  end

  def create
    
    @movie = @director.movies.build(movie_params)
    if @movie && @movie.save
      flash[:success] = "#{@movie.title} added"
      redirect_to director_path(@director)
    else
      flash.now[:error] = "Please enter all fields"
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "#{@movie.title} was updated"
      redirect_to director_path(@director)
    else
      render :edit
    end
  end

  def destroy
    @movie.delete
    flash[:success] = "#{@movie.title} was deleted"
    redirect_to movies_path
  end

  private

  def find_the_director
    @director = Director.find(params[:director_id])
  end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :user_watched, :rating, :comments, genre_id:[], :format_attributes => [:id, :name])
    end


end
