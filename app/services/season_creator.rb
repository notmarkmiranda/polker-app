# frozen_string_literal: true

class SeasonCreator
  def self.can_create_new_season?(league)
    league.seasons.where(active: true).empty?
  end
end
