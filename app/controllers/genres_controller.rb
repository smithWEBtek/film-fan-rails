class GenresController < ApplicationController

  def index
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "#{@genre.name} added"
      redirect_to genre_path(@genre)
    else
      flash.now[:error] = "Please enter a genre"
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "#{@genre.name} was updated"
    end
  end


  private

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name, movies_atrributes: [:title, :year, :description, :id])
    end


end