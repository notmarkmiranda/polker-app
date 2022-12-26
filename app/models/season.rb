class Season < ApplicationRecord
  belongs_to :league
  has_many :games

  scope :active, -> { where(active: true) }
end
