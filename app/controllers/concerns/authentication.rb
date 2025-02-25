module Authentication
  extend ActiveSupport::Concern

  class UserNotAuthenticated < StandardError; end

  included do
    rescue_from UserNotAuthenticated, with: :not_authenticated!
    helper_method :current_user
  end

  def authenticate_current_user!
    return if session[:current_user_id] && current_user.present?

    raise UserNotAuthenticated, "No currrent_user_id in session"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  private

  def not_authenticated!
    redirect_to new_session_path, alert: "You must log in first!"
  end
end
