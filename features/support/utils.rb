def wait_until
   require "timeout"
   Timeout.timeout(Capybara.default_max_wait_time) do
      sleep(0.1) until value = yield
      value
   end
end

def buttons_click (button)
  find(:id, IDs.buttons[button]).click()
  #find(:id, IDs.buttons[button]).trigger("click")
end

def login_link_click
  find(:id, IDs.login_link).click()
end

def forgot_link_click
  find(:id, IDs.forgot_link).click()
end

def sign_in_as_member (member_name)
  # initialize
  members = Members.new
  member = members.get member_name

  # logging in
  fill_in IDs.email_or_username, :with => member[:email]
  fill_in IDs.password, :with => member[:password]
  find(:id, IDs.buttons['Sign in']).click()
  sleep 1.to_i
end
