# *********************************************************
# ************************  GIVEN  *************************
# *********************************************************
Given(/^I go to the main page$/) do
  visit '/'
end

# *********************************************************
# ************************  THEN  *************************
# *********************************************************
Then(/^I should see "(.*?)" button$/) do |button|
  find(:id, IDs.buttons[button]).visible?
end
