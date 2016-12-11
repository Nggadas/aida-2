class UsersSessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to memos_path
      flash[:success] = "Thanks for logging in"
    else
      redirect_to new_users_session_path
      flash[:error] = "User cannot be found"
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to new_users_session_path
  end

end
