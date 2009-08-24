When /^I fill in valid registration information$/ do
  And %{I fill in "Login" with "bobsmith"}
  And %{I fill in "Email" with "bobsmith@example.com"}
  And %{I fill in "Password" with "123456"}
  And %{I fill in "Password Confirmation" with "123456"}
end

When /^I fill in invalid registration information$/ do
  And %{I fill in "Login" with "!!!!!!!!!!!!!!!!!"}
  And %{I fill in "Email" with "@example.com"}
  And %{I fill in "Password" with "123456"}
  And %{I fill in "Password Confirmation" with "123456"}
end