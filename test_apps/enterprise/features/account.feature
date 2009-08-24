Feature: Account
  In order to do stuff
  As a user
  I want to be able to manage my account
  
  Scenario: Going to the account page when logged in
    Given I am logged in as user "bobsmith"
    And I go to "the account page"
    Then I should be on "the account page"
  
  Scenario: Going to the account page when not logged in
    Given I am not logged in
    And I go to "the account page"
    Then I should be on "the login page"
