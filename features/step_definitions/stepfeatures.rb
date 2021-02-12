Given(/^I go to my ToDo App$/) do
  $driver.get "http://crossbrowsertesting.github.io/todo-app.html"
  
end

When(/^I archive all todos$/) do
  $driver.find_element(:name, "todo-1").click()
  $driver.find_element(:name, "todo-2").click()
  $driver.find_element(:name, "todo-3").click()
  $driver.find_element(:name, "todo-4").click()
  $driver.find_element(:name, "todo-5").click()
  sleep(3)
  $driver.find_element(:link_text, "archive").click()
end

Then(/^I should have no todos$/) do
  elems = $driver.find_elements(:class, "done-true")
  assert_equal(0, elems.length)
end
