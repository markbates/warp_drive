class User < ActiveRecord::Base
  
  def bye
    "Sorry to see you go: #{self.login}"
  end
  
end
