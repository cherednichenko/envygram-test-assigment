Feature: Home page
  As a member
  I want to see Home page
  So that I can login into the system and start using it

  Background: Member should open main page
    Given I go to the main page

    @javascript
    Scenario: Member should see that Home page is opened
      When I click Login link
      And I sign in as "QA"
      Then I should see that Home page is opened

    @javascript
    Scenario: Member should create new post
      When I click Login link
      And I sign in as "QA"
      And I open create post dropdown
      And I open create post form
      And I fill data on Create a New Post form
      And I click "Create Envygram" button
      Then I shoud see new post created
