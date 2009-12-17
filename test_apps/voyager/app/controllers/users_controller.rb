class UsersController < ApplicationController
  
  def new_with_default_name
    new_without_default_name
    @user.login = 'default_name'
  end
  
  alias_method_chain :new, :default_name
  
  def foo
  end
  
end