require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'

Capybara.configure do |config|
    case @browser
    when "chrome"
      @driver = :selenium_chrome
    when "firefox"
      @driver = :selenium
    when "chrome_headless"
      @driver = :selenium_chrome_headless
    when "firefox_headless"
      @driver = :selenium_headless
    end
end