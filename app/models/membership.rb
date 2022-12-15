class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :league

  enum role: { member: 0, admin: 1 }
end
