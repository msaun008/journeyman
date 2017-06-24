class EventsController < ApplicationController

  before_action :authenticate_user!

  def show
    @event        = Event.find(params[:id])
    @forecast     = Forecast.find_by(event: @event, user: current_user)

    # TODO replace placeholder for the actual observations.
    @observation  = nil
  end
end
