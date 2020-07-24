require 'bundler'
Bundler.require

# $:.unshift File.expand_path("lib", __FILE__)
$LOAD_PATH << 'lib'
require'app/scrapper'
require'app/email_sender'
require'views/done'
require'views/index'

Scrapper.new.perform("csv")