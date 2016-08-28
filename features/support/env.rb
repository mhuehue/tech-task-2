require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'yaml'
require 'rspec'
require 'site_prism'

$LOAD_PATH << './features/site'
require 'sections/sim_nickname_section'
require 'sections/recharge_pin_section'
require 'sections/call_forwarding_section'
require 'sections/premium_sms_limit_section'
require 'sections/auto_recharge_section'

$phantomjs_path = "C:/phantomjs-2.1.1-windows/bin/phantomjs.exe"

Capybara.configure do |config|
  config.register_driver(:chrome) { |app| Capybara::Selenium::Driver.new(app, :browser => :chrome) }
  config.register_driver(:firefox) { |app| Capybara::Selenium::Driver.new(app, :browser => :firefox) }
  config.register_driver(:poltergeist) { |app| Capybara::Poltergeist::Driver.new(app, :phantomjs => $phantomjs_path, :js_errors => false) }
  config.default_driver = :firefox
  config.javascript_driver = :poltergeist
  config.default_max_wait_time = 15
  config.default_selector = :css

  # capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false

  config.app_host = "https://www.amaysim.com.au/"
end

