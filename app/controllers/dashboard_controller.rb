class DashboardController < ApplicationController

  def home
    @seasons = Season.all
  end

end
