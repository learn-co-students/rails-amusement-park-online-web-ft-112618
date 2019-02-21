class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

end
