require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/application.rb'

app = Application.new
app.perform
