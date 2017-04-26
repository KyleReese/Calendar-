require 'google/apis/calendar_v3'

class GoogleCalendarService
  def self.events(token)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = token
    calendar_id = 'primary'
    service.list_events(
       calendar_id,
       single_events: true,
       order_by: 'startTime',
       time_min: Time.now.iso8601,
       max_results: 15
   )
  end
end
