class Season < ApplicationRecord
  belongs_to :league

  scope :active, -> { where(active: true) }
end
