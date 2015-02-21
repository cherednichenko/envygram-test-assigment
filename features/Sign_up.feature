Feature: Sign up
  As a anonymous user
  I want to Sign up new member
  So that I can register new member in the system

  Background: Member should open main page
    Given I go to the main page

    @javascript
    Scenario: Member should see Sign up form
      When I click "Join Envygram" button
      And I click 'Sign up with email' button
      Then I should see Sign up form

    @javascript
    Scenario: Member should see warnings on Sign up form
      When I click "Join Envygram" button
      And I click 'Sign up with email' button
      And I click 'Sign up' button
      Then I should see 'Required' warnings for sign up

    # for registering different users with different emails this section
    # should be re-written and adjusted in the future.
    # Or just change username and email as are unique
    @javascript
    Scenario: Member should register
      When I click "Join Envygram" button
      And I click 'Sign up with email' button
      And I fill "username" as "testerAwesome"
      And I fill "email" as "shaftAwesome@ukr.net"
      And I fill "password" as "123456"
      And I click 'Sign up' button
      Then I should see Registered successfully message

    @javascript
    Scenario: Member should see warnings when he uses the same data for sign up
      When I click "Join Envygram" button
      And I click 'Sign up with email' button
      And I fill "username" as "tester"
      And I fill "email" as "shaft@ukr.net"
      And I click 'Sign up' button
      Then I should see warnings message that such data are already taken
