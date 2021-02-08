
Given(/^open google advanced search$/) do
  $driver.get "https://www.google.com/advanced_search?hl=en"    
end

Then(/^input title, languange, and time$/) do
  sleep(2)
  if $driver.find_element(:id, 'xX4UFf').displayed?
      log "The text field is displayed"
    else
      log "The text field is not displayed"
  end
    $driver.find_element(:id, 'xX4UFf').send_keys 'Elon Musk'                # type elon musk in inpur form
  sleep(3)   
    $driver.find_element(:id,'lr_button').click                              # click dropdown language
  sleep(3)   
    $driver.find_element(:css,'.goog-menuitem[value="lang_id"]').click       # click and choose indonesian language
  sleep(3)   
  
    $driver.find_element(:id,'as_qdr_button').click                          # click dropdown time
  sleep(3)     
    #$driver.find_element(:css,'#as_qdr_menu [value="m"]').click 
    $driver.find_element(:xpath,"//*[contains(text(), 'past month')]").click # click and choose time : past month
  sleep(3)   
  
    $driver.find_element(:css,'[type="submit"]').click                       # click submit 
    sleep(3)                                                                # sleep/pause 3 second
end

Then("validate result advanced search") do
      urlNya = $driver.current_url
      log urlNya
      expect(urlNya).to include('Elon+Musk')                                        # validate url include "Elon Musk"


      getTextForm = $driver.find_element(:css, '.gLFyf.gsfi').attribute("value") 
      log getTextForm
      expect(getTextForm).to eq('Elon Musk')                                            # validate form input contains "Elon Musk"
      
      
      getTextLanguage = $driver.find_element(:xpath,"//*[contains(text(), 'Search Indonesian pages')]").text
      log getTextLanguage
      expect(getTextLanguage).to eq('Search Indonesian pages')                      # validate indonesian language 
       
      getTextTime = $driver.find_element(:xpath,"//*[contains(text(), 'Past month')]").text
      log getTextTime
      expect(getTextTime).to eq('Past month')                                       # validate time : past month
end

