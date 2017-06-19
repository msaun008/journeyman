class EventsController < ApplicationController

  def show
    @event        = Event.find(params[:id])
    @forecast     = @event.forecasts.first
    @has_forecast = @event
  end
end
