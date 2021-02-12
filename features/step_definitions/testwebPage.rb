Given(/^open test web page$/) do
  $driver.get "http://lazyautomation.co.uk/lazy1.html"
end

Then(/^input textfield, radio button, check boxes, link, dropdown-list and button$/) do

  #Verify the text "Here is some text"
  getText = $driver.find_element(:id, 'test').text                             # validate form input contains "Here is some text"
  log "The name of the text is..."+getText
  expect(getText).to eq('Here is some text')
  sleep(2)

  #  #Enter the text in the TextField textbox
  if $driver.find_element(:id, 'textfield1').displayed?
    $driver.find_element(:id, 'textfield1').send_keys 'Testing Web Page'
    # log $driver.find_element(:id, 'textfield1').text.include?('Testing Web Page').text
    log "Testing Web Page...is entered in the textfield text box"
  else 
    log "Textfield text box is not displayed"
  end

  # Checking and selecting the radio button "B"
  if $driver.find_element(:id, 'b').displayed?
    $driver.find_element(:id, 'b').click
    log "B... radio button is selected"
  else
    log "B radio button is not displayed"
  end
  sleep(2)

  # Checking a checkbox with value Hello
  if $driver.find_element(:name, 'hello').displayed?
    $driver.find_element(:name, 'hello').click
    log "Hello checkbox is selected"
  else
    log "Hello checkbox is not displayed"
  end
  sleep(3)

  # Click on the Hello World Button
  if $driver.find_element(:id, 'hello1').displayed?
    $driver.find_element(:id, 'hello1').click
    log "Hello Word Button is clicked"
  else
    log "Hello Word Button is not displayed"
  end
  sleep(2)

  #Clicking on the Link and closing the browser
  #   if $driver.find_element(:link_text, 'This is a link to another website').displayed?
  #      $driver.find_element(:link_text, 'This is a link to another website').click
  #      log "This is a link to another website is clicked"
  #   else
  #      log "This is a link to another website is not displayed"
  #   end
  #      $driver.close
  #      sleep(5)
  #

  #Option B is selected from the DropdownList
  if $driver.find_element(:xpath, "//select[@id='options1']").displayed?
    log "Number of options displayed is:"
    select = $driver.find_element(:xpath, "//select[@id='options1']")
    alloptions = select.find_elements(:tag_name, "option")
    log alloptions.size

    alloptions.each do |option|
      log "Option is ..."+option.attribute("text");
      if option.attribute("text")=="OptionB"
        option.click
        #verify dropdown option
        log $driver.find_element(:id, 'options1').text.include?('OptionB')
        sleep(5)
        log "Option B... is selected from the dropdown"
        break

      end
    end
  else
    log "Options dropdown is not displayed"
  end
end

Then(/^validate result test web page$/) do
  
#  #Verify the "Testing Web Page" text
#  getTextFieldText = $driver.find_element(:id, 'textfield1').text             # validate textfied1 input contains "Testing Web Page"
#  log getTextFieldText
#  expect(getTextFieldText).to eq('Testing Web Page')

  #Verify the "HELLO WORLD" text
  label_text = $driver.find_element(:id, 'test').text                          # validate form input contains "HELLO WORLD"
  log  "The name of the text is..."+label_text
  expect(label_text).to eq('HELLO WORLD')

end
