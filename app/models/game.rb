class Game < ApplicationRecord
  belongs_to :season
  has_many :players
end
