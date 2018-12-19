class ApplicationController < ActionController::Base
  
  def current_user
    @current_user || = User.find_by_session_token(session[:session_token])
  end

  def login!(user)

    redirect unless logged_in
  end

  def logged_in?
    @current_user.username != "" AND !@current_user.username.nil?
  end

  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url
    end
  end

end

