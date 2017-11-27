# *********************************************************
# ************************  WHEN  *************************
# *********************************************************
When(/^I click Login link$/) do
  login_link_click
end

When(/^I click Forgot Password link$/) do
  forgot_link_click
end

When(/^I click "(.*?)" button$/) do |button|
  wait_until do
    buttons_click (button)
  end
end

When(/^I sign in as "(.*?)"$/) do |member_name|
   wait_until do
     sign_in_as_member (member_name)
   end
end

# *********************************************************
# ************************  THEN  *************************
# *********************************************************
Then(/^I should see Login form$/) do
  text = find(:xpath, IDs.login_form).text
  text.should == "Sign in to your account"
end

Then(/^I should see Forgot Password form$/) do
  text = find(:xpath, IDs.forgot_form).text
  text.should == "Forgot Password"
end

Then(/^I should see 'Required' warnings for login$/) do
  sleep 3.to_i
  # checking that 'Required' text appears for email when 'Sign in' button pressed
  text = find(:id, IDs.login_warning_email).text
  text.should == "Required"

  # checking that 'Required' text appears for password when 'Sign in' button pressed
  text = find(:id, IDs.login_warning_pass).text
  text.should == "Required"
end

Then(/^user is logged in successfully$/) do
  sleep 3.to_i
  find(:xpath, IDs.user).visible?
end
