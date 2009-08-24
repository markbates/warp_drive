Feature: Login/Logout
  In order to use the site
  As a customer
  I want to be able to login and logout
  
  Scenario: Login as an existing user
    Given I am logged in as user "bobsmith"
    
  Scenario: Login as an existing user with a bad password
    Given I am user "bobsmith"
    When I go to "the login page"
    And I fill in "Login" with "bobsmith"
    And I fill in "Password" with "password2"
    And I press "Login"
    Then I should be on "the login failed page"
    And I should see "Password is not valid"
    
  Scenario: Login as a non-existent user
    Given I am not logged in
    When I go to "the login page"
    And I fill in "Login" with "bobsmith"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on "the login failed page"
    And I should see "Login is not valid"
    
  Scenario: Logout
    Given I am logged in as user "bobsmith"
    When I follow "Logout"
    Then I should be on "the login page"
    
    
    
