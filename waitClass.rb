require 'selenium-webdriver'

class WaitClass

@@instanceCount = 0

def initialize(driver)
@driver = driver
@@instanceCount += 1
puts "Instance number #@@instanceCount created"
end

def waitForAutocompleteResults
@driver.navigate.to "http://jqueryui.com/autocomplete/"
puts "title is now #{@driver.title}"
@driver.switch_to.frame @driver.find_element(:xpath, "//*[@id=\"content\"]/iframe")
autoCompleteField = @driver.find_element(:class, "ui-autocomplete-input")
autoCompleteResults = @driver.find_element(:id, "ui-id-1")
wait = Selenium::WebDriver::Wait.new(:timeout => 5)
autoCompleteField.send_keys "Ja"
wait.until { autoCompleteResults.displayed? }
results = @driver.find_elements(:class, "ui-menu-item")
results.each do |element|
if element.text == "JavaScript"
puts "Found it: #{element.text}"
break
end

end

 
end

end
