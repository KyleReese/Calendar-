class GoogleEventController < ApplicationController
  def index
    GoogleCalendarService.add_event session["token"]
    redirect_to user_events_path(user_id: current_user.id)
  end
end
