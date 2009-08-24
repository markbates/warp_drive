# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'authlogic/test_case'
require 'delayed_job_test_enhancements'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  config.global_fixtures = :all
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  #
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  #
  # For more information take a look at Spec::Runner::Configuration and Spec::Runner
  
  config.before(:each) do
    FileUtils.rm_rf(File.join(RAILS_ROOT, 'public', 'uploaded_content', 'test'))
  end
  
  config.after(:each) do
    FileUtils.rm_rf(File.join(RAILS_ROOT, 'public', 'uploaded_content', 'test'))
  end
  
end

def should_require_login(sym, *args)
  it 'should require login' do
    send(sym, *args)
    response.should redirect_to(login_path)
  end
end

def controller_should_require_login(options = {})
  {:index => :get, :new => :get, :create => :post,
   :show => :get, :edit => :get, :update => :put}.each do |action, verb|
    describe action do
      should_require_login(verb, action)
    end
  end
end

def test_fixture_path(*args)
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', *args))
end

def test_fixture_file(*args)
  File.new(test_fixture_path(*args))
end
