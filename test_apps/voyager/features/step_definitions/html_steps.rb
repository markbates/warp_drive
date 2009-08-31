Then /^I should see the image "([^\"]*)"$/ do |name|
  response.body.should match(/<img.+src=\"(\/images\/#{name}|#{name})\?.+\"/)
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)" as "([^\"]*)"$/ do |path, field, content_type|
  attach_file(field, path, content_type)
end