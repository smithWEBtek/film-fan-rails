class CommentsController < ApplicationController
  before_action :set_movie

  def index
    @movie = Movie.find(params[:movie_id])
    @comments = @movie.comments.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment posted.'
      redirect_to movie_path(@movie)
    else
      flash[:try_again] = "Something went wrong - please try again."
      redirect_to movie_path(@movie)
    end
  end

  def show
    render 'comments/index'
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy

    redirect_to movie_path(@movie)
  end



  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :book_id)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
    
  end
  
end