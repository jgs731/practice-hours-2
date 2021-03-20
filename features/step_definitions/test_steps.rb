Given('I am on the Traveline home page') do
  @driver = Selenium::WebDriver.for(:chrome)
  @driver.manage.timeouts.implicit_wait = 10

  @driver.manage.window.maximize
  @driver.get('https://www.traveline.info')
end

When('I make a search') do
  @driver.find_element(:id, 'origin').send_keys('bb1 1bb')
  sleep 1
  @driver.find_element(:id, 'destination').send_keys('m20 5aa')
  sleep 1
  @driver.find_element(:id, 'submitText').click
end

Then('I should see results') do
  Selenium::WebDriver::Wait.new(timeout: 10).until { @driver.find_element(css: '.chosen-journey-summary').displayed? }

  expect(@driver.find_elements(class: 'journey-summary').size).to eql(4)

  @driver.quit
end