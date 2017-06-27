class ForecastsController < ApplicationController

  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    validate_event_exists(@event)

    @forecast = Forecast.find_by(event: @event, user: current_user)

    # A user should only have one forecast per event. If a forecast already
    # exists for a user, lets have them edit that forecast instead
    if @forecast
      redirect_to edit_event_forecast_path(@event, @forecast)
    end

    @forecast = Forecast.new
  end

  def create
    # TODO make season and event required, write specs to test this
    @event = Event.find(params[:event_id])
    validate_event_exists(@event)

    @forecast         = Forecast.new(forecast_params)
    @forecast.event   = @event
    @forecast.season  = @event.season
    @forecast.user    = current_user

    if @forecast.save
      redirect_to @event
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    validate_event_exists(@event)

    @forecast = Forecast.find(params[:id])
    validate_forecast_owner(@forecast)
  end

  def update
    @event = Event.find(params[:event_id])
    @forecast = Forecast.find(params[:id])

    if @forecast.update(forecast_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def edit_observed
    @event = Event.find(params[:event_id])
    validate_event_exists(@event)
    @forecast = @event.observed_forecast || Forecast.new
  end

  def update_observed
    @event = Event.find(params[:event_id])
    validate_event_exists(@event)
    @forecast = @event.observed_forecast || Forecast.new
    @forecast.attributes = forecast_params

    if @forecast.save
      redirect_to @event
    else
      render 'edit_observed'
    end
  end

  private
    def forecast_params
      params.require(:forecast).permit(:high_temp, :low_temp, :precipitation, :wind)
    end

    def validate_event_exists(event)
      if !event
        redirect_to dashboard_path, alert: "1001 - Error building forecast."
      end
    end

    def validate_forecast_owner(forecast)
      if(!forecast || !forecast.user  || forecast.user != current_user)
        redirect_to dashboard_path, alert: "1002 - Cannot edit other users forecast."
      end
    end
end
