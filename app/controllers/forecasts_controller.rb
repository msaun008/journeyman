class ForecastsController < ApplicationController

  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @forecast = Forecast.new
  end

  def create
    # TODO make season and event required, write specs to test this
    @event = Event.find(params[:event_id])
    @forecast = Forecast.new(forecast_params)
    @forecast.event = @event
    @forecast.season = @event.season if @event

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
