class Customeraccounthistory
  attr_accessor :url, :account_id, :browser
  attr_accessor :transaction_date, :transaction_charges, :transaction_decription, :from_date, :to_date, :numberoftransaction
  
  def initialize(account_id, browser)
    @browser = browser
    @account_id = account_id
  end
  
  def goto
    @browser.goto 'http://10.9.30.183:7003/myAccount/billsandpayments/accountHistory.jsp'
    
    @browser.li(:class => 'header-account').click
    d=@browser.div(:class => 'header-account-list')
    d.wait_until_present
    puts d.text
    
    @browser.a(:id => @account_id).click
  end
  
  def date_picker(days, to_date)
    #TODO: pick the from date and to date within date picker
#    @from_date = 
#    @to_date =
  end
  
  def accounthistory()
    @browser.button(:id => 'View History')
            
    historytable = @browser.div(:id => "content").div(:class => "row").div(:class => "nine columns left-rail").table
    p historytable
    p historycontent = historytable.to_a
    p @numberoftransaction = historycontent.size
    
    #print "transaction date" on format of "YYYY-MM-DD"
    1.upto(@numberoftransaction -1) { |number| p Time.parse(historycontent[number][0]).strftime("%Y-%m-%d")}
    #print "transaction charges" on format of without $ sign
    1.upto(@numberoftransaction -1) { |number| p historycontent[number][1].delete "$" }
    #print "transaction description" on format of without $ sign
    1.upto(@numberoftransaction -1) { |number| p historycontent[number][2]}
  end
  


end #class
