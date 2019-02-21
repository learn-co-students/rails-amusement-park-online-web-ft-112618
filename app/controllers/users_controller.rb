
class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = admin_helper(params[:user][:admin])
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def signin

  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render signin, alert: "Could not validate you"
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  private

  def admin_helper(string)
    if string == "1"
      true
    else
      false
    end
  end

  # private
  #
  # def require_login
  #
  # end

end
