# Airbnb App

## Installation

If you want to install on your machine, you can follow the simple steps:

This app is using Ruby version 2.7.1.

1. You can see, this page is not in direct repository. It is at **thehackingproject/week5/day4**, you need to return the base of repository **thehackingproject**
2. Then, copy the link https of this repository and use `git clone` to clone the project on your computer
3. In the folder **thehackingproject** clone, go to directly in the folder **week5/day4** and open your terminal on this folder. Or you can use the command `cd` to go to in that folder: `cd week5/day4`
4. If you use the Ruby version 2.5.1 or other version on your machine, you need to change in the Gemfile to take that version
   
  For example for the 2.5.1 version: 


  My Gemfile with the ruby version: 2.7.1
  ```ruby
  #Gem file
  source "https://rubygems.org"
  ruby '2.7.1'
  ```

  Gemfile to change with the Ruby version 2.5.1
  ```ruby
  #Gem file
  source "https://rubygems.org"
  ruby '2.5.1'
  ```
5. Use command `bundle install` to install all the gem dependencies.
6. To launch the program, tap `rails server` and open your browser in `localhost:3000`
