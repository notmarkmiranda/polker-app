# frozen_string_literal: true

class Seasons::GamesController < ApplicationController
  before_action :load_season

  def show
    @game = Game.includes(season: :league).find(params[:id]).decorate
    # authorize @game
  end

  def new
    @game = @season.games.new
    authorize @game
  end

  def create
    @game = @season.games.new(game_params)
    if @game.save
      redirect_to season_game_path(@season, @game)
    else
      render :new
    end
  end

  def complete
    @game = Game.includes(season: {league: :memberships}).find(params[:id])
    authorize @game
    @game.complete!
  end

  private

  def game_params
    params.require(:game).permit(
      :season_id,
      :date_time,
      :estimated_player_count,
      :location,
      :compeleted,
      :buy_in,
      :add_ons,
      payout_schedule: {}
    )
  end

  def load_season
    @season ||= Season.find(params[:season_id])
  end
end
