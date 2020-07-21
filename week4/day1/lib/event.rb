require 'pry'
require 'time'

class Event
  attr_accessor :start_date , :duration, :title , :attendees
  # Event.new("2019-01-13 09:00", 10, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])
  def initialize(start_date, duration,title,attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  def postpone_24h
    return self.start_date + 24*60*60
  end

  def end_date
    return self.start_date + duration*60
  end

  def is_past?
    return (Time.now > self.start_date) ? true : false
  end

  def is_future?
    return (Time.now < self.start_date) ? true: false
  end

  def is_soon?
    return (self.start_date + 30*60 >= Time.now) ? true : false
  end
   def to_s
    puts ">Title: Appointement super important"
    puts ">Start date: #{self.start_date.strftime("%Y-%m-%d %k:%m")}"
    puts ">Duration: #{self.duration} minutes"
    puts ">Invite: #{self.attendees.join(', ')}"
   end
end

binding.pry
puts "End of file"