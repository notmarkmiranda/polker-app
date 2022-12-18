class MembershipsController < ApplicationController
  before_action :require_user

  def index
    @memberships = current_user.memberships.group_by(&:status)
  end

  def approve
    membership = current_user.memberships.find(params[:id])
    # membership.can_approve?
    membership.active!
    redirect_to memberships_path
  end

  def archive
    membership = current_user.memberships.find(params[:id])
    # membership.can_archive?
    membership.archived!
    redirect_to memberships_path
  end

  def reject
    membership = current_user.memberships.find(params[:id])
    # membership.can_archive?
    membership.rejected!
    redirect_to memberships_path
  end
end
