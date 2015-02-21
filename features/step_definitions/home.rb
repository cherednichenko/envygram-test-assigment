# *********************************************************
# ************************  WHEN  *************************
# *********************************************************
When(/^I open create post dropdown$/) do
  find(:xpath, IDs.dropdown_create_post).click()
end

When(/^I open create post form$/) do
  find(:xpath, IDs.dropdown_create_post_open).click()
end

When(/^I fill data on Create a New Post form$/) do
  wait_until do
    # fill out the form with all data entered
    find(:xpath, IDs.headline).set("Awesome POST from QA!")
    find(:xpath, IDs.media_combo).click()
    find(:xpath, IDs.image_from_internet).click()
    find(:xpath, IDs.source).set("http://fotkidepo.ru/photo/471055/50250P7KI2ds90H/911462w.jpg")
    find(:xpath, IDs.save_source).click()
    sleep 3.to_i
    find(:xpath, IDs.select_adType).click()
    find(:xpath, IDs.description).set("Awesome description from Shaft!")
  end
end

# *********************************************************
# ************************  THEN  *************************
# *********************************************************
Then(/^I should see that Home page is opened$/) do
  sleep 3.to_i
  page.current_url.should == Capybara.app_host + "/home"
end

Then(/^I shoud see new post created$/) do
  text = find(:xpath, IDs.check_created_post).text
  text.should == "Awesome POST from QA!"
end
