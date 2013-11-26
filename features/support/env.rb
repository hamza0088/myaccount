# to include lib directory and subfolders under, where contains the domain code, page object
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib/pages')
$: << File.dirname(__FILE__)+'/../../lib/'

# for page object
require 'rubygems'
require 'watir-webdriver'
#require 'watir'
require 'time'
require "win32/process"

#for webservice
require "savon"
require "Nokogiri"
require "date"

#for reno's framework
require 'webservicelayer'
require 'domainlayer'
require 'customeraccountbill_page'
require 'customeraccounthistory_page'

  ONE_WEEK = 7
  TWO_WEEKS = 14
  THREE_WEEKS = 21
  ONE_MONTH = 30
  TWO_MONTHS = 60
  THREE_MONTHS = 90
  FOUR_MONTHS = 120
  FIVE_MONTHS = 150
  SIX_MONTHS = 180
  SEVEN_MONTHS = 210

#CGI Mock server URLs:
CGI_ACCOUNTBILL_URL = 'http://10.9.30.183:8080/ws-mock-server/CustomerAccountBill?wsdl'
CGI_ACCOUNTFINANCIALEVENT_URL = 'http://10.9.30.183:8080/ws-mock-server/CustomerAccountFinancialEvent?wsdl'
CGI_PREFERENCE_URL = 'http://10.9.30.183:8080/ws-mock-server/Preference?wsdl'
CGI_ACCOUNT_URL = 'http://10.9.30.183:8080/ws-mock-server/Account?wsdl'
CGI_BILLING_URL = 'http://10.9.30.183:8080/ws-mock-server/Billing?wsdl'

#ESI QA/TST server URLs.
ESIQA_ACCOUNTBILL_URL = 'http://devqasoal01.sjrb.lab:8011/CustomerAccountBill_v1/ProxyServices/CustomerAccountBill12PS?wsdl'
ESIQA_ACCOUNTFINANCIALEVENT_URL = 'http://devqasoal01.sjrb.lab:8011/CustomerAccountFinancialEvent_v1/ProxyServices/CustomerAccountFinancialEvent12PS?wsdl'
ESIQA_ADDRESS_URL = 'http://devqasoal01.sjrb.lab:8011/Address_v1/ProxyServices/Address12PS?wsdl'
ESIQA_PREFERENCE_URL = 'http://deved1soal01.sjrb.lab:8011/PreferenceEBS_v1/ProxyServices/PreferenceEBS12PS?wsdl'

#ESI DEV server URLs. 
ESIDEV_ACCOUNTBILL_URL = 'http://deved1soal01.sjrb.lab:8011/CustomerAccountBillEBS_v1/ProxyServices/CustomerAccountBillEBS12PS?wsdl'
ESIDEV_ACCOUNTFINANCIALEVENT_URL = 'http://deved1soal01.sjrb.lab:8011/CustomerAccountFinancialEventEBS_v1/ProxyServices/CustomerAccountFinancialEventEBS11PS?wsdl'
ESIDEV_PREFERENCE_URL = 'http://deved1soal01.sjrb.lab:8011/PreferenceEBS_v1/ProxyServices/PreferenceEBS12PS?wsdl'
ESIDEV_ADDRESS_URL = 'http://deved1soal01.sjrb.lab:8011/AddressEBS_v1/ProxyServices/AddressEBS11PS?WSDL'
ESIDEV_BILLING_URL = 'http://deved1soal01.sjrb.lab:8011/BillingEBS_v1/ProxyServices/BillingEBS11PS?wsdl'
ESIDEV_CONTACT_URL = 'http://deved1soal01.sjrb.lab:8011/ContactEBS_v1/ProxyServices/ContactEBS11PS?wsdl'
  
