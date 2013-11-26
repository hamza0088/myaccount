#----------------------------------
# Feature 56
#----------------------------------
@account_history
Feature: Bills - Customer views account history
  In order  have knowledge on my charge and billing trend,
  As a customer
  I want to see all my account activities for up to six months in the past so that I can validate the details in the bill.

  # Scenario 1
  Scenario: Default view of account history
    Given the account 03109764005 history for the past two weeks is not empty
    When the customer accesses the default 14 days view of account history
    Then the site should display all transactions for the past two weeks
    And the site should display the total number of transactions found
#    And the site should populate the transaction type filter list based on the returned transactions
#    And the site should indicate the filter is to show All transactions

  # Scenario 2
  Scenario Outline: System returns all the transactions for the time period selected
    Given the account 03101013235 history for the past six months is not empty
    When the customer selects from date is <days> earlier than the <todate>
    And the customer submits the request to view the account history for the time period selected
    Then the site should display all transactions for the time period selected
    And the site should display the total number of transactions found for the time period selected
#    And the site should populate the transaction type filter list based on the returned transactions
#    And the site should indicate the filter is to show All transactions

    Examples: 
      | days | todate     |
      | 30   | 2013-11-25 |
#      | 1    | 2013-11-01 |
#      | 7    | 2013-11-01 |
#      | 30   | 2013-11-01 |
#      | 60   | 2013-11-01 |
#      | 90   | 2013-11-01 |
#      | 120  | 2013-11-01 |
#      | 150  | 2013-11-01 |
#      | 180  | 2013-11-01 |
#      | 181  | 2013-11-01 |

  # Scenario 3
  Scenario Outline: The From Date is later than the To Date
    Given the account 03110068106 history for the past six months is not empty
    When the customer selects from date is <days> later than the <todate>
    And the customer submits the request to view the account history for the time period selected
    Then the site should display From Date the same as To Date

    Examples: 
      | days | todate     |
      | 30   | 2013-11-25 |
#      | 1    | 2013-11-01 |
#      | 7    | 2013-11-01 |
#      | 30   | 2013-11-01 |
