class RidesController < ApplicationController
  def rides
    @attraction = Attraction.find_by(id: params[:attraction_id])
    @user = User.find_by(id: session[:user_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    
    if @ride.take_ride == true
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:notice] = @ride.take_ride
    end
    redirect_to user_path(@user)
  end
end
