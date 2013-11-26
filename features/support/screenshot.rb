After do |scenario|
  if scenario.failed?
    Dir.mkdir("/temp") unless File.exists?("/temp")
    Dir.chdir("/temp")
    #screenshot_file = "screenshot-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    screenshot_file = "FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot_file)
    embed(screenshot_file, "image/png")
  end   
end