require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  integrate_views
  
  should_require_login(:delete, :destroy)
  
end
