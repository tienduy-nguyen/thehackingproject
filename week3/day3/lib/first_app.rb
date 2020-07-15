require 'twitter'
require 'dotenv'

Dotenv.load('.env')

def login_twitter 
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['TWITTER_API_KEY']
    config.consumer_secret  = ENV['TWITTER_API_SECRET']
    config.access_token  = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end
  return client
end

def scrap_data 
  client = login_twitter()
  # Check out https://github.com/sferik/twitter#usage-examples
  
  # Update a tweet
  # client.update('My first tweet in Ruby !!!!')
  
  # Sending a tweet
  # client.search('#ruby').take(1).each do |tweet|
  #   client.update("@#{tweet.user.screen_name} Hey I'am learning Ruby and I love it too. What are your favorite blogs?")
  # end
  file_name="data/data.txt"
  
  if !File.file?(file_name)
    File.new(file_name, "w")
  end
  
  f = File.open(file_name,"w")
  client.search("#ruby on rails").take(3).each do |tweet|
    f.puts tweet.text
  end
  f.close
end

