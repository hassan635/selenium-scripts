require 'selenium-webdriver'
require_relative 'clickClass'
require_relative 'waitClass'

driver = Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait = 5
driver.navigate.to "https://jqueryui.com/"
puts "Starting Clickclass"
clicker = ClickClass.new(driver)

clicker.clickByCssSelector
puts "cssSelector done. moving towards classname selector"

#clicker.clickByClassname
#puts "clickbyclassname done. moving towards xpath"

clicker.clickByxpath
puts "clickbyxpath done."

puts "Starting waiter"
waiter = WaitClass.new(driver)
waiter.waitForAutocompleteResults
puts "Waiter done waiting. Congratz..."

driver.quit

