Given(/^I am on the lazy automation page$/) do
  $driver.get "http://lazyautomation.co.uk/lazy1.html"
end

Then(/^verify the text field is displayed$/) do
  if $driver.find_element(:id, 'textfield1').displayed?
    log "The text field is displayed"
  else
    log "The text field is not displayed"
end
  end
  
When("I enter {string} into the text field") do |text|
 $driver.find_element(:id, 'textfield1').send_keys(text)
  sleep(3)
end


Then("the text field is populated with  {string}") do |text|
  expect($driver.find_element(:id, 'textfield1').attribute('value')).to eq text
end