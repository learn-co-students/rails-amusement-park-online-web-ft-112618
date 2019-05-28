class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :admin_only

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to root_path if !current_user
  end

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

end
