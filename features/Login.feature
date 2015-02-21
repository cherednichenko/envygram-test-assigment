Feature: Login
  As a anonymous user
  I want to see Login form with different types of login or do forgot password
  So that I can login with my mail address and password into the system

  Background: Member should open main page
    Given I go to the main page

    @javascript
    Scenario: Member should see Login form
      When I click Login link
      Then I should see Login form

    @javascript
    Scenario: Member should see Forgot Password form
      When I click Login link
      And I click Forgot Password link
      Then I should see Forgot Password form

    @javascript
    Scenario: Member should see warnings
      When I click Login link
      And I click "Sign in" button
      Then I should see 'Required' warnings for login

    # for simulating and checking different situations lile: was user activated or not
    # this section should be updated and adjusted in the future.
    @javascript
    Scenario: Member should login successfully
      When I click Login link
      And I sign in as "QA"
      Then user is logged in successfully
