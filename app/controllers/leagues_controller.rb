# frozen_string_literal: true

class LeaguesController < ApplicationController
  before_action :require_user

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = current_user.leagues.new
  end

  def create
    @league = current_user.leagues.new(league_params)
    if @league.save
      # flash
      redirect_to @league
    else
      # flash
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :location, :is_public)
  end
end
