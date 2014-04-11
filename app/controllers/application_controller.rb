class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= Admin.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized." if current_user.nil?
  end

  def check_owner
    redirect_to root_path, alert: "Not authorized." if current_user.nil? || !current_user.owner
  end
end
