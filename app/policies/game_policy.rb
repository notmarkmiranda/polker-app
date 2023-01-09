# frozen_string_literal: true

class GamePolicy < ApplicationPolicy
  def new?
    user_is_admin?(user, record.league)
  end

  def complete?
    user_is_admin?(user, record.league)
  end
end
