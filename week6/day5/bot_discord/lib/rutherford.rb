require 'discordrb'
require_relative 'water'
require_relative 'error'
require 'dotenv'
Dotenv.load('.env')

# Start WaterTracker instance for later use
# Start an error instance
wt = WaterTracker.new()
re = RutherError.new()


print "Hello, I'm Rutherford. Currently running.\n"

# New bot instance
bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], prefix: '!'

# Simple ping pong response. Good for testing functionality
bot.command :ping do |event|
  event.respond "Pong! Time taken: #{ Time.now - event.timestamp } seconds."
end

bot.command :help do |event|
  event << '```List of commands:'
  event << '    !help:   displays info about commands.'
  event << '    !water start:   this starts a timer that will remind you to drink water each hour.'
  event << '    !water stop:    stops the water reminder.'
  event << '    !ping:  Replies with "Pong!" as well as the time taken to respond. Good for testing connection.'
  event << '    !thanks:  Thank Rutherford for his hard work.```'
end

# Runs the water tracking functionality. Reminds user to drink water
# args is an Array, of max size 1
bot.command( :water, max_args: 1 ) do |_event, *args|

  # Turn the command into a string
  command = "#{ args.at(0).downcase }"

  resp = wt.water(command, _event.user)
 
  # Different response based on if you are stopping or starting
  # Also throws a general unknown_command() error if "start" or "stop"
  # is not supplied. Ex: "asdfasdf" throws an error.
  if resp == 0
    _event.respond 'Hi! I\'m going to start to reminding you to drink water. Hydration is healthy :grinning:'
  elsif resp == 1 
    _event.respond 'Stopping water tracking.'
  elsif resp == -1
    _event.respond re.unknown_command( command ) 
  end

end

bot.command :thanks do |event|
     event.respond 'No problem. I just want to help! :smile:'
end

bot.run