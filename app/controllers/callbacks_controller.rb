class CallbacksController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
    session["token"] = request.env["omniauth.auth"]["credentials"]["token"]
  end
end
