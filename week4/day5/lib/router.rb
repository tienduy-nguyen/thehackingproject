require_relative 'controller.rb'

class Router
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform
    puts "|----------------------------------|"
    puts "|   WELCOME TO THE GOSSIP PROJECT  |"
    puts "|----------------------------------|"

    while true
      puts "Choose one option,please:"
      puts "1. I want to create a gossip."
      puts "4. I want to quite this app."
      params = gets.chomp.strip.to_i

      case params
      when 1
        puts "You chose to create a gossip."
        @controller.create_gossip
      when 4
        puts "See you soon!"
        break
      else
        puts "This option is not available, please try again."
      end
    end

  end
end