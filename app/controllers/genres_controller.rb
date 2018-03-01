class GenresController < ApplicationController

  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :find_the_movie

  def index
    @format = Genre.all
  end

  def new
    @Genre = Genre.new
  end

  def create
    @genre = @movie.genres.build(genres_params)
    if @genre && @genre.save
      flash[:success] = "#{@genre.name} added"
      redirect_to director_path(@director)
    else
      flash.now[:error] = "Please enter a genre"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @genre.update(genres_params)
      flash[:notice] = "#{@genre.name} was updated"
    end
  end

  def destroy
    @genre.delete
  end

  private

    def find_the_movie
      @movie = Movie.find(params[:movie_id]) #find the parent
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def format_params
      params.require(:genre).permit(:name)
      # params.require(:format).permit(:name, movie_ids: [])
    end


end