class ForecastsController < ApplicationController

  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)

    @forecast.season = Season.first
    @forecast.event = Event.first

    if @forecast.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
    def forecast_params
      params.require(:forecast).permit(:high_temp, :low_temp, :precipitation, :wind)
    end
end
