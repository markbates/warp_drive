module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
    when /the login page/
      login_path
    when /the login failed page/
      user_session_path
    when /the account page/
      account_path
    when /the registration page/
      register_path
    when /the registration failed page/
      users_path
    when /the new interest page/
      new_interest_path
    when /the interest show page/
      interest_path
    when /the interests list page/
      interests_path
    when /the forgot password screen/
      new_password_reset_path
    when /a bad password reset page/
      password_reset_path('345678')
    when /the foo page/
      '/foo'
      
    
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
