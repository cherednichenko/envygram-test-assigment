# *********************************************************
# ************************  WHEN  *************************
# *********************************************************
When(/^I click Login link$/) do
  find(:id, IDs.login_link).click()
end

When(/^I click Forgot Password link$/) do
  find(:id, IDs.forgot_link).click()
end

When(/^I click "(.*?)" button$/) do |button|
  wait_until do
    find(:id, IDs.buttons[button]).click()
    #find(:id, IDs.buttons[button]).trigger("click")
  end
end

When(/^I sign in as "(.*?)"$/) do |member_name|
   wait_until do
     # initialize
     members = Members.new
     member = members.get member_name

     # logging in
     fill_in IDs.email_or_username, :with => member[:email]
     fill_in IDs.password, :with => member[:password]
     find(:id, IDs.buttons['Sign in']).click()
     sleep 1.to_i
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
