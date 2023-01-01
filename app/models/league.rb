class League < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :seasons

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  delegate :full_name, to: :user, prefix: true

  def seasons_count
    seasons.count
  end

  def admin_memberships
    memberships.admin
  end

  def active_season
    seasons.active.first
  end
end
