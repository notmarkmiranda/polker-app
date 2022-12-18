class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :league

  enum role: { member: 0, admin: 1 }
  enum status: { pending: 0, active: 1, rejected: 2, archived: 3 }

  delegate :full_name, to: :user, prefix: true

  def league_name
    league.name
  end
end
