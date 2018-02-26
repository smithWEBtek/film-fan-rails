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
      flash[:success] = "#{@director.name} added"
      redirect_to directors_path(@director)
    else
      flash.now[:error] = "Please enter all fields"
      render :new
    end
  end

  def show
    @movies = @director.movies.build
  end

  def edit
  end

  def update
    if @director.update(director_params)
      flash[:success] = "#{@director.name} was updated"
      redirect_to director_path(@director)
    else
      render :edit
    end
  end

  def destroy
    @director.delete
    flash[:success] = "#{@director.name} was deleted"
    redirect_to directors_path
  end

  private

    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :discovered, :rating, :notes)
    end

end
