Before do #|scenario|
  #Chrome dirver instantiation
caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {detach: true})
$driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
$driver.manage.window.maximize
#$driver.get "http://lazyautomation.co.uk/lazy1.html"


$driver.get "http://shop.theTestingWorld.com"
log $driver.current_url
log "The Page Title is: #{$driver.title}"

end
After do # |scenario|
  $driver.quit
end
#require 'selenium-webdriver'
#
#caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {detach: true})
#$driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
#$driver.manage.window.maximize
#$driver.get"https://www.amazon.com/"
#puts "The Page Title is: #{$driver.title}"
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#puts "The Test is Passed" if wait.until {
#  /title/.match($driver.page_source)
#}

#SuccessMessage = driver.title
#log SuccessMessage
