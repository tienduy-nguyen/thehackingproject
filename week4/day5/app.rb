require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/router.rb'

router = Router.new
router.perform

binding.pry