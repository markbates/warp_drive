Then /^I should receive a welcome email for "([^\"]*)"$/ do |login|
  email = ActionMailer::Base.deliveries.first
  email.should_not be_nil
  email.subject.should == 'Welcome!'
  email.body.should match(/username: #{login}/)
  email.from.should == [configatron.emails.welcome.from]
end

Then /^I should receive a forgot password email for "([^\"]*)" and follow the link$/  do |login|
  user = User.find_by_login(login)
  email = ActionMailer::Base.deliveries.first
  email.should_not be_nil
  email.subject.should == 'Password Reset Instructions'
  path = password_reset_path(user.perishable_token)
  email.body.should match(path)
  email.from.should == [configatron.emails.password_reset_instructions.from]
  visit(path)
end
