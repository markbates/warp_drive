Then /^I should be a user in the database with a login of "([^\"]*)"$/ do |login|
  User.find_by_login(login).should_not be_nil
end

Then /^I should not be a user in the database with a login of "([^\"]*)"$/ do |login|
  User.find_by_login(login).should be_nil
end

Given /^I am user "([^\"]*)"$/ do |login|
  @user = Factory(:user, :login => login)
  @current_user = @user
end

Given /^I am not logged in$/ do
  @current_user = nil
  # session.reset!
end