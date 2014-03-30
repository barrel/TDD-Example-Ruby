require_relative '../app'
require 'rack/test'
require 'capybara/rspec'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

Capybara.configure do |config|
  config.run_server = false
  # config.default_driver = :selenium
  config.app_host = 'http://localhost:9292'
end

Capybara.app = app