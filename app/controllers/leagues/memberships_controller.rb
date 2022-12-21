# frozen_string_literal: true

class Leagues::MembershipsController < ApplicationController
  before_action :require_user, :load_league

  def index
    @memberships = @league.memberships.group_by(&:status)
  end

  def new
    @membership = @league.memberships.new
  end

  def create
    email = params[:membership][:email]
    user = User.find_by_email(email)
    user ||= User.create(email: email, password: SecureRandom.hex(13))
    @membership = @league.memberships.new(membership_params.merge(user_id: user.id))
    if @membership.save
      redirect_to league_memberships_path(@league)
    else
      render :new
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.archived!
    redirect_to league_memberships_path(@league)
  end

  def activate
    membership = Membership.find(params[:id])
    membership.active! if membership.can_be_active?
    redirect_to league_memberships_path(@league)
  end

  def pending
    membership = @league.memberships.find(params[:id])
    membership.pending! if membership.can_be_pending?
    redirect_to league_memberships_path(@league)
  end

  def reject
    membership = @league.memberships.find(params[:id])
    membership.rejected! if membership.can_be_rejected?
    redirect_to league_memberships_path(@league)
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :league_id, :role, :active)
  end

  def load_league
    @league ||= League.includes(:memberships).find(params[:league_id])
  end
end
