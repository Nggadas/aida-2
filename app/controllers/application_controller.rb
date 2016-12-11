class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  rescue_from ActiveRecord::RecordNotFound, with: :render_404


  def render_404
    respond_to do |format|
      format.html do
        render file: 'public/404.html',
               status: :not_found, layout: false
      end
      format.json do
        render status: 404, json: {
            msessage: "Not found"
        }
      end
    end
  end

  def logged_in?
    current_user
  end
  helper_method :logged_in?


  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user


  def require_user
    if current_user
      true
    else
      redirect_to new_users_session_path
      flash[:notice] =  "You must be logged in to access that page"
    end
  end

end
