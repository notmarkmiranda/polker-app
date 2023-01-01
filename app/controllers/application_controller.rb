class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user

  def redirect_user
    redirect_to dashboard_path if current_user
  end

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def current_admin_user
    puts "BBBB"
    current_user if current_user&.superadmin?
  end

  def authenticate_admin_user!
    if current_admin_user
      puts "LOGIN"
      true
    else
      puts "NO USER"
      redirect_to sign_in_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
