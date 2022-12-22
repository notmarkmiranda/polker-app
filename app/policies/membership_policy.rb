# frozen_string_literal: true

class MembershipPolicy < ApplicationPolicy
  def admin?
    league.user == user || league.admin_memberships.pluck(:user_id).include?(user.id)
  end

  private

  def league
    record.league
  end
end
