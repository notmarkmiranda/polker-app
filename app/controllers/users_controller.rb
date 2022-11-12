# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_user, only: [:new, :create]
  before_action :require_user, only: [:show]

  # this is the dashboard path
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :first_name, :last_name)
  end
end
