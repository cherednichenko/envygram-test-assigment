require 'capybara'
require 'rspec'
require 'capybara/cucumber'
require 'capybara/poltergeist'

require File.dirname(__FILE__) + '/members'
require File.dirname(__FILE__) + '/ids'
require File.dirname(__FILE__) + '/utils'

#Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

Capybara.app_host = 'http://68.169.52.12/EnvyGram/html'
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_wait_time = 15
Capybara.ignore_hidden_elements = false

Capybara.register_driver :poltergeist do |app|
   options = {
      :js_errors => true,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
   }
   Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

Capybara.default_driver = :selenium
#Capybara.javascript_driver = :poltergeist
#Capybara.javascript_driver = :poltergeist_debug
#Capybara.javascript_driver = :selenium_chrome

# -- Custom Settings --
MEMBERS = Members.new
