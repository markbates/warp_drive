Feature: Forgotten Passwords
  In order to help me login
  As a user
  I want to be able to reset my forgotten password

  Scenario: Reset Password
    Given I am user "bobsmith"
    When I go to "the login page"
    And I follow "Forgot Your Password?"
    Then I should be on "the forgot password screen"
    And I fill in "Email" with "bobsmith@example.com"
    And I press "Reset my password"
    Then I should be on "the login page"
    And I should see "Instructions to reset your password have been emailed to you."
    And I should receive a forgot password email for "bobsmith" and follow the link
    Then I fill in "Password" with "123456"
    And I fill in "Password Confirmation" with "123456"
    Then I press "Update my password and log me in"
    Then I should be on "the account page"
    
  Scenario: Attempt to Reset Password with a bad token
    Given I am user "bobsmith"
    When I go to "a bad password reset page"
    Then I should be on "the login page"
