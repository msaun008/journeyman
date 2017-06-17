class SeasonsController < ApplicationController

  before_action :find_season, only: [:show, :edit, :update, :destroy]

  def index
    @seasons = Season.all
  end

  def show
  end

  def new
    @season = Season.first
    # 2.times{ @season.events.build }
  end

  def create
    @season = Season.new(season_params)

    if @season.save
      redirect_to @season
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @season.update(season_params)
      redirect_to @season
    else
      render 'edit'
    end
  end

  def destroy
    if @season.destroy
      redirect_to seasons_path
    else
      redirect_to @season
    end
  end

  private
    def season_params
      params.require(:season).permit(:name, events_attributes: [:id, :start_date, :duration, :location, :station, :_destroy])
    end

    def find_season
      @season = Season.find(params[:id])
    end
end
