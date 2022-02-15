require 'tod'
require 'pry'

class Theater
  CLEAN = 20
  PREVIEWS = 15
  SHOWTIME_INCREMENTS = 5
  OPERATING_HOURS = {
    weekdays: {
      open: '11:00am',
      close: '11:00pm'
    },
    weekends: {
      open: '10:30', close: '12:00am'
    }
  }

  attr_reader :hours, :clean, :previews, :showtime_increment

  def initialize
    @hours = {}
    OPERATING_HOURS.each do |type, schedule|
      @hours.store(type, {
                     open: Tod::TimeOfDay.parse(schedule[:open]),
                     close: Tod::TimeOfDay.parse(schedule[:close])
                   })
    end
    @clean = CLEAN * 60
    @previews = PREVIEWS * 60
    @showtime_increment = SHOWTIME_INCREMENTS
  end
end
