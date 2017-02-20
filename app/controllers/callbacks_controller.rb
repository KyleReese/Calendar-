class CallbacksController < ApplicationController
  def google_oauth2
    byebug
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
