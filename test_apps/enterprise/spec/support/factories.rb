Gemtronics.find_and_require_gem('thoughtbot-factory_girl')

Factory.sequence :login do |n|
  "bob#{n}"
end

Factory.define(:user) do |f|
  f.login {Factory.next(:login)}
  f.password('password')
  f.password_confirmation('password')
  f.email do |u| 
    "#{u.login}@example.com"
  end
end