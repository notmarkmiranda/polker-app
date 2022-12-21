# frozen_string_literal: true

class Leagues::SeasonsController < ApplicationController
  def create
    league.seasons.create! if SeasonCreator.can_create_new_season?(league)
    redirect_to league_path(league)
  end

  private

  def league
    @league ||= League.find(params[:league_id])
  end
end
