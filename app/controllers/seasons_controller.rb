# frozen_string_literal: true

class SeasonsController < ApplicationController
  def show
    @season = Season.find(params[:id])
  end
end
