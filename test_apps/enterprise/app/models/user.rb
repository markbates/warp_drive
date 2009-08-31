class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :email
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    PostmanWorker.deliver_password_reset_instructions(self)
  end
  
  def hello
    "hello: #{self.login}"
  end
  
  def bye
    "bye: #{self.login}"
  end
  
end
