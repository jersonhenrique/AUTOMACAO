require "base64"

Before do
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.window.maximize
  @driver.manage.timeouts.implicit_wait = 20 
end

After do
  shot_file = @driver.save_screenshot("log/screenshot.png")
  shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
  embed(shot_b64, "image/png", "Screenshot") # Cucumber anexa o screenshot no report
  @driver.quit
end
