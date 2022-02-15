require_relative 'theater'
require_relative 'movie'
require 'pry'

# Scheduler for each movie and based on single theater
class Scheduler
  def initialize(theater:)
    @theater = theater
  end

  def round_down(time, minutes)
    time - (time.to_i % (minutes * 60))
  end

  def show_times(movie:)
    runtime = movie.runtime * 60

    showtimes = {}
    @theater.hours.each do |schedule_type, hours|
      showings = []
      time = round_down(hours[:close] - runtime, @theater.showtime_increment)
      while time >= hours[:open]
        showings.unshift(time) if (time - @theater.previews) > hours[:open]
        time = round_down(time - runtime - @theater.clean - @theater.previews, @theater.showtime_increment)
      end
      showtimes.store(schedule_type, showings)
    end
    showtimes
  end
end
