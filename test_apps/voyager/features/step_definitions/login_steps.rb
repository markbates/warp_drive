Given /^I am not a user$/ do
  user = User.find_by_login('bobsmith')
  user.destroy if user
end

Given /^I am logged in as user "([^\"]*)"$/ do |login|
  Given %{I am user "#{login}"}
  When %{I go to "the login page"}
  And %{I fill in "Login" with "#{login}"}
  And %{I fill in "Password" with "password"}
  And %{I press "Login"}
  Then %{I should be on "the account page"}
end