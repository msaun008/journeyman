class DashboardController < ApplicationController

  before_action :authenticate_user!, only: [:home]

  def frontdoor

  end

  def home
    @seasons = [Season.first]
  end

  private
    def get_active_seasons
      # TODO Refine this algorithm as seasons evolve during development
      Season.joins(:events).group('season.id').to_a;
    end

end
