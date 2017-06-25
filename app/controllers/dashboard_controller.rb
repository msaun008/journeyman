class DashboardController < ApplicationController

  before_action :authenticate_user!, only: [:home]
  before_action :authenticate_admin_user!, only: [:admin_panel]

  def frontdoor

  end

  def home
    @seasons = [Season.first]
  end

  def admin_panel
  end

  private
    def get_active_seasons
      # TODO Refine this algorithm as seasons evolve during development
      Season.joins(:events).group('season.id').to_a;
    end

end
