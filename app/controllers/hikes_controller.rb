class HikesController < ApplicationController

  before_action :set_hike, only: [:show, :update, :complete, :favorite]

  def index
    @hikes = Hike.includes(:national_park).all
  end

  def complete
    @hike.complete!
  end

  def hike_params
    params.require(:hike).permit(:rating, :difficulty, :notes)
  end

  private

  def set_hike
    @hike = Hike.includes(:national_park).find_by_id[:id]
  end

end
