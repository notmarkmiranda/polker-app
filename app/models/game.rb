class Game < ApplicationRecord
  belongs_to :season
  delegate :league, to: :season
  has_many :players

  scope :date_time_order, -> { order(date_time: :desc) }

  def total_pot
    estimated_player_count * buy_in
  end

  def number
    season.games.order(date_time: :asc).find_index(self) + 1
  end
end
