# THE GOSSIP PROJECT 

This is project to show all gossips of moussaillons at THP.

## Introduction

- Using sinatra framework, rack and shotgun
- CRUD: Create, Read, Update and Detroy gossips
- No database yet, use JSON as a solution
- Using Bootstrap
- Deploy to heroku

## Installation

This app is using Ruby version 2.7.1

To install project, follow the simple steps:

1. You can see, this page is not in direct repository. It is at **thehackingproject/week4/day4**, you need to return the base of repository **thehackingproject**
2. Then, copy the link https of this reposiotory and use `git clone` to clone the project on your computer
3. In the folder **thehackingproject** clone, go to directly in the folder **week4/day4** and open your terminal on this folder. Or you can use the command `cd` to go to in that folder: `cd week5/day1`
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