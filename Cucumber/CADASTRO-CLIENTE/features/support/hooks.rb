require 'fileutils'

Before do
  FileUtils.mkdir_p('log')
end

After do |scenario|
  next unless scenario.failed?

  screenshot_name = "#{scenario.name.gsub(/[^A-Za-z0-9]/, '_').downcase}_#{Time.now.to_i}.png"
  screenshot_path = File.join('log', screenshot_name)

  page.save_screenshot(screenshot_path)
  embed(File.binread(screenshot_path), 'image/png', 'Screenshot')
end
