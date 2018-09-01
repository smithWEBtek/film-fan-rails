
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
    if @movie.save
      @movie.update(user_id: current_user.id)
      
      redirect_to genres_path, flash: {success: "'#{@movie.title}' was added!"}
    else
      flash.now[:error] = "Please enter all fields"
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comments = @movie.comments
    @comment = Comment.new

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @movie}
      
    end
    
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

  def watched
    @movie = Movie.find(params[:id])
    if @movie.user_id = current_user.id
      @movie.watched = !@movie.watched 
      @movie.save
      redirect_to directory_path(current_user.id), flash: {success: "Movie has been watched!"}
    else
      flash[:error] = "Movie was not added to watched movies."
    end
  end

  private


    def movie_params
      params.require(:movie).permit(:title, :year, :description, :director, :genre_id, :genres_attributes => [:id, :name, :_destroy])
    end


end
