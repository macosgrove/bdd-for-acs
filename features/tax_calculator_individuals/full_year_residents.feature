Feature: Calculate individual taxes for full year residents
  In order to know how much more tax I have to pay
  As an Australian full year resident
  I want to calculate my net tax owing

  @javascript
  Scenario: Tax credits and medicare levy only
    Given I have started the latest comprehensive tax calculator
    Then I should see "Are you a resident for income tax purposes?"
    And I am a Resident for the full year
    When my income details are:
      | Income type     | amount  |
      | taxable income  | 134,200 |
      | fringe benefits | 5000    |
    And I choose to include the following tax calculation items:
      | tax credits   |
      | medicare levy |
    And my tax credits are:
      | PAYG installments   | 23000 |
      | Franking tax offset | 1200  |
    Then my tax estimates are expected to be:
      | Tax on taxable income | 37601.00 |
      | Medicare levy         | 2013.00  |
      | Total tax payable     | 39614.00 |
      | Net tax payable       | 15414.00 |
