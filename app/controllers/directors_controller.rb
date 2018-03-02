class DirectorsController < ApplicationController

  before_action :set_director, only: [:show, :edit, :update, :destroy]

  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    @director.user = current_user
    if @director && @director.save
      redirect_to directors_path(@director), flash:{success: "#{@director.name} added"}
    else
      render :new, flash: {error: "Please enter all fields"}
    end
  end

  def show
    @movies = @director.movies
  end

  def edit
  end

  def update
    if @director.update(director_params)
      
      redirect_to director_path(@director), flash: {success: "#{@director.name} was updated"}
    else
      render :edit
    end
  end

  def destroy
    @director.delete
    redirect_to directors_path, flash: {success: "#{@director.name} was deleted"}
  end

  private

    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :discovered, :rating, :notes)
    end

end
