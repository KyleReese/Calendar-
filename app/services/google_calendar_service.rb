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
  def self.add_event(token)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = token
    event = Google::Apis::CalendarV3::Event.new({
      'summary':'Calendar++',
      'description':'A chance to hear more about Google\'s developer products.',
      'start':{
        'date_time': DateTime.parse('2017-04-29T09:00:00-06:00'),
      },
      'end':{
        'date_time': DateTime.parse('2017-04-29T10:00:00-06:00'),
      }
    })
    result = service.insert_event('primary',event)
  end
end
