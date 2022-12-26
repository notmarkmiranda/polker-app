# frozen_string_literal: true

class Leagues::SeasonsController < ApplicationController
  def create
    if SeasonCreator.can_create_new_season?(league)
      league.seasons.create!
      redirect_to league_path(league)
    else
      redirect_to league_seasons_confirmation_path(league)
    end
  end

  def confirmation
    @league = league
  end

  def confirm
    league.seasons.active.update_all(active: false)
    league.seasons.create!
    redirect_to league
  end

  private

  def league
    @league ||= League.find(params[:league_id])
  end
end
