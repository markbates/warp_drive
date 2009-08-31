When /^I fill in valid interest information$/ do
  And %{I fill in "Title" with "Pez Dispensers"}
  And %{I fill in "Description" with "I really like Pez Dispensers"}
  And %{I fill in "Tags" with "pez, candy, hobby, tasty"}
end

When /^I edit the interest details for "([^\"]*)"$/ do |login|
  @original_interest = current_user.interests.first
  visit(edit_interest_path(@original_interest))
  And %{I fill in "Title" with "#{@original_interest.title.succ}"}
  And %{I fill in "Description" with "#{@original_interest.description.succ}"}
  And %{I fill in "Tags" with "pez, candy, hobby, tasty"}
end

Then /^my interest details should be updated$/ do
  current_user.reload
  interest = current_user.interests.first
  interest.title.should == @original_interest.title.succ
  interest.description.should == @original_interest.description.succ
end

Then /^my interest should be destroyed$/ do
  current_user.reload
  current_user.interests.size.should == 9
end
