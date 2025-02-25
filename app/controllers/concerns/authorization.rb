module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    after_action :verify_authorized
    rescue_from Pundit::NotAuthorizedError, with: :deny_access!
  end

  private

  def deny_access!(error)
    redirect_to projects_path, alert: error.message
  end
end