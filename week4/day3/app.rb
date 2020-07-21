require 'bundler'
Bundler.require

$:.unshift File.expand_path("lib", __FILE__)
require'scrapper'

Scrapper.new.perform