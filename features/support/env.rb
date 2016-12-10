require 'cucumber/rails'
ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  ActiveRecord::FixtureSet.reset_cache
  fixtures_folder = File.join(Rails.root, 'spec', 'fixtures')
  fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
  ActiveRecord::FixtureSet.create_fixtures(fixtures_folder, fixtures)
end
Cucumber::Rails::Database.javascript_strategy = :transaction

module Cucumber
  module Rails
    class World
      include FactoryGirl::Syntax::Methods
    end
  end
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, args: %w{ window-size=1024,768 no-sandbox })
end

Capybara.javascript_driver = :chrome
#Capybara.run_server = false
Capybara.configure do |config|
  config.app_host = "http://localhost:3000"
  config.server_port = 3000
end
