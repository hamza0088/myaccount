class Customeraccountbill
  attr_accessor :url, :account_id, :browser
  attr_accessor :invoice_date, :total_charges, :viewlink, :pdflink
  
  def initialize(account_id, browser)
    @browser = browser
    @account_id = account_id
  end
  
  def goto
    @browser.goto 'http://10.9.30.183:7003/myAccount/billsandpayments/viewBill.jsp'
  end
  
  def accountBill()
    @browser.li(:class => 'header-account').click
    d=@browser.div(:class => 'header-account-list')
    d.wait_until_present
    puts d.text
    
    @browser.a(:id => @account_id).click
    billtable = @browser.div(:id => "content").div(:class => "row").div(:class => "nine columns left-rail").table
    p billtable
    p billcontent = billtable.to_a
    p months = billcontent.size
    
    #print "invoice date" on format of "YYYY-MM-DD"
    1.upto(months -1) { |number| p Time.parse(billcontent[number][0]).strftime("%Y-%m-%d")}
    #print "total charges" on format of without $ sign
    1.upto(months -1) { |number| p billcontent[number][1].delete "$" }
  end
  
  def load_browser()
    time = Time.new()
    time_int = time.to_i()
    program_files = ENV['ProgramFiles'] || "c:\\Program Files"
    startup_command = "#{program_files}\\Internet Explorer\\iexplore.exe"
    startup_command << " -private"
    #startup_command << " -nomerge"
    startup_command << " -noframemerging"
    unique_title = "about:#{time_int}_#{rand(10000)}"
    process_info = Process.create(:app_name => "#{startup_command} #{unique_title}",
      :creation_flags => Process::DETACHED_PROCESS,
      :process_inherit => false)

    @browser = Watir::Browser.attach(:url, unique_title)
    return @browser
  end
end #class
