# Create A Bot Twitter App With Ruby

### First app

- Connect with Twitter app through secret key
- Make a tweet by API
- Collect/find a keyword with user and send a tweet to this user
- Search some interesting tweets and save them to a file .txt

### Bot Twitter

- Auto tweet
- Auto like
- Auto follow
  

#### Twitter gem overview
- Create bundle
  ```bash
  bundle init
  ```
- Add the necessary package to Gemfile
  ```ruby
  source "https://rubygems.org"

  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

  # gem "rails"
  ruby '2.7.1'
  gem 'dotenv'
  gem 'pry'
  gem 'rspec'
  gem 'rubocop'
  gem 'twitter'
  ```
- Install bundle
  ```bash
  bundle install
  ```
- Init testing with rspec
  ```bash
  bundle exec rspec --init
  ```
- Configuration login twitter
  Create lib/app.rb
  ```ruby
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['consumer_key']
    config.consumer_secret = ENV['consumer_secret']
    config.access_token = ENV['access_token']
    config.access_token_secret = ENV['access_secret']
  end
  ```
#### Some simple Twitter API

- Like tweets
  ```ruby
  client.favorite(tweets)
  ```
- Follow another users
  ```ruby
  client.follow(*users)
  ```
- Search tweets
  ```ruby
  client.search(words,lang:'en').first.text
  client.search(words).take(1).user

  ```
- Update a tweet

  If the authenticated user has granted read/write permission to your application, you may tweet as them.
  ```ruby
  client.update('This is my first tweet via Ruby!!!')
  ```

  Post an update in reply to another tweet.
  ```ruby
  client.update("I'm tweeting with @gem!", in_reply_to_status_id: 402712877960019968)
  ```

  Post an update with precise coordinates.
  ```ruby
  client.update("I'm tweeting with @gem!", lat: 37.7821120598956, long: -122.400612831116, display_coordinates: true)
  ```

  Post an update from a specific place. Place IDs can be retrieved using the #reverse_geocode method.

  ```ruby
  client.update("I'm tweeting with @gem!", place_id: "df51dec6f4ee2b2c")
  ```

  Post an update with an image.

  ```ruby
  client.update_with_media("I'm tweeting with @gem!", File.new("/path/to/media.png"))
  ```

  Post an update with a possibly-sensitive image.
  ```ruby
  client.update_with_media("I'm tweeting with @gem!", File.new("/path/to/sensitive-media.png"), possibly_sensitive: true)
  ```

  Post an update with multiple images.
  ```ruby
  media = %w(/path/to/media1.png /path/to/media2.png).map { |filename| File.new(filename) }
  client.update_with_media("I'm tweeting with @gem!", media)
  ```

  Make a request "Tweets for user"
  ```ruby
  # get from user
  tweets = client.user_timeline('rubyinside', count: 20)
  tweets.each { |tweet| puts tweet.full_text }
  ```