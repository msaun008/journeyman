class SeasonsController < ApplicationController

  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

  private
    def season_params
      params.require(:season).permit(:name)
    end
end
