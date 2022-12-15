# frozen_string_literal: true

class Leagues::MembershipsController < ApplicationController
  before_action :require_user, :load_league

  def index
    @memberships = @league.memberships
  end

  private

  def load_league
    @league ||= League.includes(:memberships).find(params[:league_id])
  end
end
