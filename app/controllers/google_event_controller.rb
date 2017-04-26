class GoogleEventController < ApplicationController
  def index
    GoogleCalendarService.add_event session["token"]
    redirect_to events_path
  end
end
