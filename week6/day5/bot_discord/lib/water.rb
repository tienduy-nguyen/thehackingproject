 
# A water tracker is an object that takes commands
# It functions for at max 4 hours to prevent a user from leaving it on
# indefinitely
class WaterTracker
  @@ONE_HOUR = 3600     # One hour in seconds
  def initialize()
    #   trackers: a hash table that keeps track of which water tracker
    #              belongs to which user. Allows for multiple water
    #              water trackers to be going on simultaneously
    @trackers = Hash.new(nil)
  end

  def water(command, user)
    if command == "start"
      puts "WaterTracker Instance: starting water tracking\n"
      t1 = Thread.new{tracking_time(user)}
      #aborts on any exception
      t1.abort_on_exception = true
      @trackers[user] = t1
      return 0

    elsif command == "stop"
      puts "WaterTracker Instance: stopping water tracking\n"
      @trackers[user].kill
      return 1

    else
      puts "ERROR water.rb: Unknown command #{ command }\n"
      return -1
    end

  end

  def tracking_time(user)
    #   start_time: start time for an instance of WaterTracker
    #   remind_time: the time the user will be reminded to drink water
    #                 caluclated by adding one hour in seconds to 
    #                 @start_time
    #   hours_passed: count of how many hours have passed
    start_time = Time.now
    remind_time = start_time + @@ONE_HOUR
    hours_passed = 0

    while hours_passed < 4  do

      if ( ( remind_time - Time.now ) <= 0 )
        user.pm("Have you had some water recently? Make sure to keep hydrated! :heart:")
        puts "Water reminder sent.\n"
        start_time = Time.now
        remind_time = start_time + @@ONE_HOUR
        hours_passed = hours_passed + 1
      end

    end
    
    user.pm("I'm going to stop reminding you to drink water now. Use the command again if you'd like me to continue!")

  end

end