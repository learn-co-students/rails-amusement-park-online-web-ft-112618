class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      @message = params[:message]
    else
      redirect_to root_url
    end
  end

  def update
    if logged_in?
       #@attraction = Attraction.find(params[:attraction][:id])
       @user = User.find(params[:id])
       session[:message] = @user.rides.create(attraction_id: params[:attraction][:id]).take_ride
       redirect_to user_path(@user)
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
