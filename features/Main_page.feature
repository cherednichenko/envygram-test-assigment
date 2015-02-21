Feature: Main page
  As a anonymous user
  I want to see main page with Join Envygram button
  So that I can recognize the website as long as I see main webpage opened

  Background: Member should open main page
    Given I go to the main page

    @javascript
    Scenario: Member should see main page
      Then I should see "Join Envygram" button
