begin
  browser = nil
  Browser = Watir::Browser
  browser = Browser.new :chrome
end

Before do
#  @browser = Watir::Browser.new :ff
@browser = browser
end

#After do
#  @browser.close
#end


# "after all"
at_exit do
  browser.close
end
