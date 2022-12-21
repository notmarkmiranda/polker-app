class League < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :seasons

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  delegate :full_name, to: :user, prefix: true
end
