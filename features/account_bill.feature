#----------------------------------
# Feature 55
#----------------------------------
@account_bill
Feature: Bills - Customer views previous bills list
  In order  have knowledge on my charge and billing trend,
  As a customer
  I want view a list of previous bills up to five months in the past,
  I want also be able to view each month’s bill in PDF format so that I can valide the details in the bill.

  # Scenario 1
  Scenario: The account does not have previous months bills
    Given the account 03109764005 does not have previous bill
    When the customer views previous bill list
    Then the site should not display any previous actual-months bill

  # Scenario 2
  Scenario: The account has one to five previous months bills
    Given the account 03101013235 has one to five previous bills
    When the customer views previous bill list
    Then the site should display the list of previous actual-months bills
    And with information of invoice-date
    And total-charges on the bill
    And to view the pdf-option

  # Scenario 3
  Scenario: The account has more than five previous months bills
    Given the account 03110068106 has more than five previous months bills
    When the customer views previous bill list
    Then the site should display the latest previous five actual-months bills
    And with information of invoice-date
    And total-charges on the bill
    And to view the pdf-option
