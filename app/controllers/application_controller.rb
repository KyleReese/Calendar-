class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allowed_path?

  def reject
    redirect_to "/422.html"
  end

  def allowed_path?
    reject if request.params["user_id"] && !current_user
    reject if request.params["user_id"] && current_user.id.to_s != request.params["user_id"]
  end
  # before_action :authenticate_user!
end
