require 'discordrb'
require 'dotenv'
Dotenv.load('.env')

bot = Discordrb::Bot.new token: ENV['TOKEN']

# Here we output the invite URL to the console so the bot account can be invited to the channel. This only has to be
# done once, afterwards, you can remove this part if you want
puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

# This method call adds an event handler that will be called on any message that exactly contains the string "Ping!".
# The code inside it will be executed, and a "Pong!" response will be sent to the channel.
bot.message(content: 'I love you!') do |event|
  event.respond 'I love you too!'
end

# This method call has to be put at the end of your script, it is what makes the bot actually connect to Discord. If you
# leave it out (try it!) the script will simply stop and the bot will not appear online.
bot.run

