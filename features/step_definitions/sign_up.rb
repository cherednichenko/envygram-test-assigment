# *********************************************************
# ************************  WHEN  *************************
# *********************************************************
When(/^I click 'Sign up with email' button$/) do
  find(:xpath, IDs.sign_up_with_email).click()
end

When(/^I click 'Sign up' button$/) do
  find(:xpath, IDs.sign_up).click()
end

When(/^I fill "(.*?)" as "(.*?)"$/) do |field, value|
  find_field(IDs.text_boxes[field], match: :first).set(value)
end

# *********************************************************
# ************************  THEN  *************************
# *********************************************************
Then(/^I should see Sign up form$/) do
  text = find(:xpath, IDs.sign_up_form).text
  text.should == "Sign up with email"
end

Then(/^I should see 'Required' warnings for sign up$/) do
  sleep 3.to_i
  # checking that 'Required' text appears for email when 'Sign up' button pressed
  text = find(:id, IDs.sign_up_warning_email).text
  text.should == "Required"

  # checking that 'Required' text appears for password when 'Sign up' button pressed
  text = find(:id, IDs.sign_up_warning_pass).text
  text.should == "Required"
end

Then(/^I should see Registered successfully message$/) do
  sleep 4.to_i
  # checking that 'Registered successfully' text appears in activation dlg
  # when 'Sign up' process was finished successfully
  text = find(:xpath, IDs.success).text
  text.should == "Registered successfully"
end

Then(/^I should see warnings message that such data are already taken$/) do
  sleep 3.to_i
  # checking that same data are already taken during Sign up process
  text = find(:id, IDs.sign_up_warning_email).text
  text.should == "Email already registered. If you forget your password please click on password restore link"
end
