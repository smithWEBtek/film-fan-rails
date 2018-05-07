class SessionsController < ApplicationController

  def new
    @user = User.new
    redirect_to users_path if logged_in?
  end

  #login through social media or signup form
  def create
    if auth
      @user = User.set_user_from_omniauth(auth['uid'])
      log_user_in
      redirect_to root_path(@user), flash: {success: "You're logged in through Facebook!"}
    else
      #find user by username
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        log_user_in
        redirect_to root_path,  flash: {success: "You're logged in!"}
      else
        redirect_to '/sessions/new', flash: {danger: "Invalid email/password combination!"}
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path, flash: {success: "You're logged out!"}
  end

  private

    def auth
      request.env['omniauth.auth']
    end



end
