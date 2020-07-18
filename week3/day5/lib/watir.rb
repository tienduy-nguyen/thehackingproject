require 'watir'
require 'pry'

# browser = Watir::Browser.new :chrome
# Selenium::WebDriver.logger.output = 'selenium.log'
# Selenium::WebDriver.logger.level = :error
browser = Watir::Browser.new :chrome, options: {options: {detach: true}}
# browser = Watir::Browser.new :chrome
browser.goto('https://google.com/')
# binding.pry
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Example of watir in ruby")

#méthode de la barre d'entrée
search_bar.send_keys(:enter)
browser.driver.manage.timeouts.implicit_wait = 3
search_result_divs = browser.divs(class:"rc")
search_result_divs.each { |div| p div.h3.text }

p "Action completed, close browser"
browser.close
