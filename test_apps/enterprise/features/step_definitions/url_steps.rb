Given /^I try to view an "([^\"]*)" for "([^\"]*)"$/ do |model, login|
  user = create_user_with_interests(:login => login)
  case model
  when "interest"
    visit(interest_path(user.interests.first))
  end
end

When /^I try to edit an "([^\"]*)" for "([^\"]*)"$/ do |model, login|
  user = create_user_with_interests(:login => login)
  case model
  when "interest"
    visit(edit_interest_path(user.interests.first))
  end
end

When /^I try to update an "([^\"]*)" for "([^\"]*)"$/ do |model, login|
  user = create_user_with_interests(:login => login)
  case model
  when "interest"
    interest = user.interests.first
    visit(interest_path(interest), :put, :interest => interest.attributes)
  end
end

When /^I try to delete an "([^\"]*)" for "([^\"]*)"$/ do |model, login|
  user = create_user_with_interests(:login => login)
  case model
  when "interest"
    interest = user.interests.first
    visit(interest_path(interest), :delete)
  end
end

Then /^I should see the 404 page$/ do
  And %{I should see "We could not find the page you are looking for"}
  response.status.should == '404 Not Found'
end
