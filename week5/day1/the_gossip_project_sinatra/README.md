# THE GOSSIP PROJECT 

This is project to show all gossips of moussaillons at THP.

**Check out the demo on [td-gossip.herokuapp.com](https://td-gossip.herokuapp.com/)**

## Introduction

- Using sinatra framework, rack and shotgun
- CRUD: Create, Read, Update and Detroy gossips
- No database yet, use JSON as a solution
- Using Bootstrap
- Deploy to heroku

## Installation

If you want to install on your machine, you can follow the simple steps:

This app is using Ruby version 2.7.1.

1. You can see, this page is not in direct repository. It is at **thehackingproject/week5/day1**, you need to return the base of repository **thehackingproject**
2. Then, copy the link https of this reposiotory and use `git clone` to clone the project on your computer
3. In the folder **thehackingproject** clone, go to directly in the folder **week5/day1** and open your terminal on this folder. Or you can use the command `cd` to go to in that folder: `cd week5/day1`
4. If you use the Ruby version 2.5.1 or other version on your machine, you need to change in the Gemfile to take that version
   
  For example for the 2.5.1 version: 


  My Gemfile with the ruby version: 2.7.1
  ```ruby
  #Gem file
  source "https://rubygems.org"
  ruby '2.7.1'
  gem 'sinatra'
  gem 'pry'
  ```

  Gemfile to change with the Ruby version 2.5.1
  ```ruby
  #Gem file
  source "https://rubygems.org"
  ruby '2.5.1'
  gem 'sinatra'
  gem 'pry'
  ```
5. Use command `bundle install` to install all the gem dependencies.
6. To launch the program, tap `shotgun -p 4567` and open your browser in `localhost:4567`


## Deploy to heroku

Deploy app Ruby sinatra or rails to heroku is very simple.

- Create an app on [heroku.com](https://dashboard.heroku.com/apps)
- Creat new repository
  ```bash
  cd my-project/
  git init
  heroku git:remote -a <name_app>
  ```
- Deploy application
  
  ```bash
  git add .
  git commit -m 'Init project'
  heroku create
  git push heroku master
  ```

- Attention with error "Ruby version" when push to heroku master
  
  For example: `Your Ruby version is 2.5.1, but your Gemfile specified 2.7.1`

  We need change in gemfile and re-comit it

  ```bash
  bundle update --ruby
  git add Gemfile Gemfile.lock
  git commit -m "Update ruby version"

  ```