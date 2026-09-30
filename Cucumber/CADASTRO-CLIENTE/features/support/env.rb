require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'rspec/expectations'

Dir[File.join(__dir__, '..', 'pages', '*.rb')].sort.each { |file| require file }

World(Capybara::DSL)
World(RSpec::Matchers)

Capybara.configure do |config|
  config.default_max_wait_time = 15
  config.default_driver = :selenium_chrome
  config.javascript_driver = :selenium_chrome
  config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--window-size=1440,900')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox') if ENV['OS'] == 'Linux'
  options.add_argument('--headless=new') if ENV.fetch('BROWSER', 'chrome').include?('headless')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('--width=1440')
  options.add_argument('--height=900')
  options.add_argument('-headless') if ENV.fetch('BROWSER', 'chrome').include?('headless')

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

browser_name = ENV.fetch('BROWSER', 'chrome').downcase

Capybara.default_driver = case browser_name
when 'firefox'
  :selenium_firefox
when 'chrome_headless'
  :selenium_chrome
when 'firefox_headless'
  :selenium_firefox
else
  :selenium_chrome
end

Capybara.javascript_driver = Capybara.default_driver

Before do
  page.driver.browser.manage.window.maximize if page.driver.browser.respond_to?(:manage)
end