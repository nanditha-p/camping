class HikesController < ApplicationController

  before_action :set_hike, only: [:show, :complete]

  def index
    @hikes = Hike.includes(:national_park).all
  end

  def complete
    @hike.complete!(hike_params[:rating], hike_params[:time_taken])
  end

  def hike_params
    params.require(:id).permit(:rating, :time_taken)
  end

  private

  def set_hike
    @hike = Hike.includes(:national_park).find_by_id[:id]
  end

end
