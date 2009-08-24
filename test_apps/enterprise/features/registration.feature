Feature: User Registrations
  In order to make the site useful user's should be allowed to register.
  We should ask for minimal information, such as login, email, and password.

  Scenario: Registering a valid user
    Given I am not logged in
    When I am on "the registration page"
    And I fill in valid registration information
    And I press "Save"
    Then I should be on "the account page"
    And I should be a user in the database with a login of "bobsmith"
    And I should receive a welcome email for "bobsmith"

  Scenario: Registering a non-valid user
    Given I am not logged in
    When I am on "the registration page"
    And I fill in invalid registration information
    And I press "Save"
    Then I should be on "the registration failed page"
    And I should not be a user in the database with a login of "bobsmith"
    And I should see "Login should use only letters, numbers, spaces, and .-_@ please."