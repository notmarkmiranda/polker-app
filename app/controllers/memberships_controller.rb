class MembershipsController < ApplicationController
  before_action :require_user

  def index
    @memberships = current_user.memberships.group_by(&:status)
  end

  def approve
    membership = current_user.memberships.find(params[:id])
    membership.active! if membership.can_be_active?
    redirect_to memberships_path
  end

  def archive
    membership = current_user.memberships.find(params[:id])
    membership.archived! if membership.can_be_archived?
    redirect_to memberships_path
  end

  def reject
    membership = current_user.memberships.find(params[:id])
    membership.rejected! if membership.can_be_rejected?
    redirect_to memberships_path
  end
end
