class ApiController < ApplicationController
  def show
    @user = Apartment::Tenant.switch! "users_#{params[:id]}"
    @events = Event.all
    render json: @events
  end
end
