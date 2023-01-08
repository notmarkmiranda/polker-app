class Season < ApplicationRecord
  belongs_to :league
  has_many :games

  scope :active, -> { where(active: true) }

  def number
    league.seasons.order(created_at: :asc).find_index(self) + 1
  end
end
