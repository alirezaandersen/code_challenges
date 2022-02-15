require 'pry'
require_relative 'theater'
require_relative 'movie'
require_relative 'scheduler'

# Console interaction
class MovieTimes

  TITLES = [
    "There's Something About Mary (1998). Rated R | 134",
    'The Imitation Game (2014). Rated R | 114',
    'The Imitation Game (2014). Rated PG-13 | 187',
    'Lair Lair (1997). Rated PG-13 | 187'
  ]

  attr_reader :scheduler

  def initialize
    @theater = Theater.new
    @scheduler = Scheduler.new(theater: @theater)
  end

  def display_intro
    puts 'Which movie are we scheduling today?'
  end

  def parse_title
    @@count = 1
    TITLES.size.times do |num|
      puts "Select #{num + 1} for #{TITLES[num].split('|').first}"
      num += 1
      @@count += 1
    end
  end

  def start
    display_intro
    loop do
      parse_title
      puts "Select #{@@count} to add a new title"
      puts 'Select q to quit anytime'
      print '>'
      puts ''
      input = gets.chomp
      process_input(input)
    end
  end

  def process_input(input)
    if input === 'q'
      quit_game
    elsif input.to_i <= TITLES.size
      title = input.to_i - 1
      movie = Movie.new(TITLES[title])
      show_times(movie)
    elsif input.to_i == @@count
      add_title(input.to_i - 1)
    else
      puts "Invalid selection for #{input}. Please try again"
      puts ''
    end
  end

  def add_title(title)
    puts "Please use the following format: title | minutes"
    print '>'
    input = gets.chomp
    parts = input.split('|')
    return unless correct_title?(parts)
    TITLES << input
    movie = Movie.new(TITLES[title])
    show_times(movie)
  end

  def correct_title?(parts)
    return puts 'Invalid format please select another option' unless parts.size == 2
    return puts 'Invlaid minutes format' unless parts[1].strip.scan(/\D/).empty?
    true
  end

  def invalid_hours?(title,hours)
    if hours.values.flatten.empty?
      TITLES.delete(title)
      true
    end
  end

  def show_times(movie)
    movie_hours = scheduler.show_times(movie: movie)
    puts movie.title
    puts ''
    return puts 'not enough time in the day to play this movie' if invalid_hours?(movie.title,movie_hours)

    movie_hours.each do |type, showtimes|
      puts type.to_s
      showtimes.each do |showtime|
        endtime = showtime + (movie.runtime * 60)
        puts "\ #{showtime.to_s(:short)} - #{endtime.to_s(:short)}"
      end
      puts ''
    end
  end

  def quit_game
    puts 'Have a great day!'
    exit
  end
end

m = MovieTimes.new
m.start
