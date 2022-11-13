# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      # flash
      redirect_to dashboard_path
    else
      # flash
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
