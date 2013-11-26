#This step contains Given step within Scenario 1, 2, 3 
Given /^the account (#{CAPTURE_ACCOUNT_NUMBER}) (?:does not have previous bill|has one to five previous bills|has more than five previous months bills)$/ do |accountid|
  @webaccount = Myaccount.new(accountid)
end

#This step is reused by scenario 1, 2 and 3
When(/^the customer views previous bill list$/) do
  @cgi_ws = Webservice.new()
  @cgi_ws.customerAccountBillService_FindCustomerAccountBillDocument(@webaccount.accountid, SIX_MONTHS, ONE_MONTH, ESIDEV_ACCOUNTBILL_URL)
  
  @account_bill_page = Customeraccountbill.new(@webaccount.accountid, @browser)
  @account_bill_page.goto
  @account_bill_page.accountBill() 
end

Then /^the site should not display any previous actual\-months bill$/ do
  @account_bill_page.invoice_date.should == @cgi_ws.billdate_node
  @account_bill_page.total_charges.should == @cgi_ws.amount_node
  @account_bill_page.pdflink.should == @cgi_ws.documentlocation_node
end

#Scenario 2
Then(/^the site should display the list of previous actual\-months bills$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^with information of invoice\-date$/) do
  #@account_bill_page.invoice_date.should eq(@cgi_ws.billdate_node), "Expected the balance to be #{@cgi_ws.billdate_node}"
  @account_bill_page.invoice_date.should == @cgi_ws.billdate_node
end

Then(/^total\-charges on the bill$/) do
  #@account_bill_page.total_charges.should eq(@cgi_ws.amount_node), "Expected the balance to be #{@cgi_ws.amount_node}"
  @account_bill_page.total_charges.should == @cgi_ws.amount_node
end

Then(/^to view the pdf\-option$/) do
  #@account_bill_page.pdflink.should eq(@cgi_ws.documentlocation_node), "Expected the balance to be #{@cgi_ws.documentlocation_node}"
  @account_bill_page.pdflink.should == @cgi_ws.documentlocation_node
end

#Scenario 3
Then /^the site should display the latest previous five actual\-months bills$/ do
  pending # express the regexp above with the code you wish you had
end
