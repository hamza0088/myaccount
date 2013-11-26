#This step contains Given step within Scenario 1
Given /^the account (#{CAPTURE_ACCOUNT_NUMBER}) history for the past two weeks is not empty$/ do |accountid|
  @webaccount = Myaccount.new(accountid)
end

When /^the customer accesses the default (#{CAPTURE_A_NUMBER}) days view of account history$/ do |days|
  @esi_ws = Webservice.new()
  @esi_ws.customerAccountFinancialEventService_FindCustomerAccountFinancialEvent(@webaccount.accountid.to_s, days, 0, ESIDEV_ACCOUNTFINANCIALEVENT_URL)
  
  @account_history_page = Customeraccounthistory.new(@webaccount.accountid.to_s, @browser)
  @account_history_page.goto
  @account_history_page.accounthistory(14, 0) 
end

Then /^the site should display all transactions for the past two weeks$/ do
  @account_history_page.transaction_date.should == @esi_ws.creationdate_node
  @account_history_page.transaction_charges.should == @esi_ws.amount_node
  @account_history_page.transaction_decription.should == @esi_ws.ratedescription_node
end

Then /^the site should display the total number of transactions found$/ do
  @account_history_page.transaction_number.should == @esi_ws.amount_node.size
end

#Then /^the site should populate the transaction type filter list based on the returned transactions$
#/ do
#  @account_history_page.filter_type.should ==  @account_history_page.transaction_decription
#end

#this step will be reused by scenario 1 and 2
#Then /^the site should indicate the filter is to show All transactions$/ do
#  pending # express the regexp above with the code you wish you had
#end

#This step is reused by multiple scenarios 2 and 3
Given /^the account (#{CAPTURE_ACCOUNT_NUMBER}) history for the past six months is not empty$/ do |accountid|
  @webaccount = Myaccount.new(accountid)
end

#reused by multiple scenarios: 2, 3
When /^the customer selects from date is (#{CAPTURE_A_NUMBER}) (?:earlier|later) than the (#{CAPTURE_A_DATE})$/ do |days, to_date|
  @esi_ws = Webservice.new()
  @esi_ws.customerAccountFinancialEventService_FindCustomerAccountFinancialEvent(@webaccount.accountid.to_s, days, 0, ESIDEV_ACCOUNTFINANCIALEVENT_URL)
  
  @account_history_page = Customeraccounthistory.new(@webaccount.accountid, @browser)
  @account_history_page.goto
  @account_history_page.date_picker(days, to_date)
end

When /^the customer submits the request to view the account history for the time period selected$/ do
  @account_history_page.accounthistory()
  #@esi_ws = Webservice.new()
end

Then /^the site should display all transactions for the time period selected$/ do
  1.upto (@account_history_page.numberoftransaction - 1)  |number|
  {
    @account_history_page.transaction_date[number].should <= @account_history_page.to_date,
    @account_history_page.transaction_date[number].should >= @account_history_page.from_date
  }
end

Then /^the site should display the total number of transactions found for the time period selected$/ do
  @account_history_page.numberoftransaction.should == @esi_ws.creationdate_node.size
end

#Then /^the site should populate the transaction type filter list based on the returned transactions$/ do
#  pending # express the regexp above with the code you wish you had
#end


#This step contains Given step within Scenario 3
Then /^the site should display From Date the same as To Date$/ do
  @account_history_page.from_date.should == @account_history_page.to_date
end