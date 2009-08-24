class Postman < ActionMailer::Base
  default_url_options[:host] = configatron.emails.host
    
  def welcome_email(user)
    subject     'Welcome!'
    from        configatron.emails.welcome.from
    recipients  user.email
    sent_on     Time.now
    body        :user => user
  end
  
  def password_reset_instructions(user)
    subject       'Password Reset Instructions'
    from          configatron.emails.password_reset_instructions.from
    recipients    user.email
    sent_on       Time.now
    body          :password_reset_url =>  password_reset_url(user.perishable_token)
  end

end
