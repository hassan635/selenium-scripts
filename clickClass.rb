

class ClickClass

@@instanceCount=0 # class variable(must be initialized)
EXCHANGERATE = 111 #Constant (must be initialized)

def initialize(driver)
@driver = driver #instance variable
@@instanceCount += 1
puts "Instance count is now #@@instanceCount"
puts "Exchange rate for euro is #{EXCHANGERATE}" 
end

def clickByClassname
@driver.switch_to.frame @driver.find_element(:xpath, "//*[@id=\"content\"]/iframe")
selectelement = @driver.find_element(:id, "speed")
select_list = Selenium::WebDriver::Support::Select.new(selectelement)
select_list.select_by(:text, 'Fast')
select_option = select_list.selected_options[0].text
puts "Selected option was #select_option"
@driver.switch_to.default_content
end

def clickByCssSelector
#@driver.switch_to.frame @driver.find_element(:class, 'demo-frame')
#select_link_element = @driver.find_element(:css, "a[href=\'https://jqueryui.com/selectmenu/\']")
#select_link_element.click
@driver.navigate.to "http://jqueryui.com/selectmenu/"
puts "title of page is #{@driver.title}"
#@driver.switch_to.default_content
end

def clickByxpath
@driver.switch_to.frame @driver.find_element(:xpath, "//*[@id=\"content\"]/iframe")
select_second_menu = @driver.find_element(:xpath, "//*[@id=\"number-button\"]")
select_second_menu.click
@driver.switch_to.default_content
end

end
