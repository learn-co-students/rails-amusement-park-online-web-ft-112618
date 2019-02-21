class AttractionsController < ApplicationController
  before_action :require_login, :current_user, :current_attraction
  skip_before_action :current_attraction, only: [:index, :new, :create]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  private

  def current_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end
