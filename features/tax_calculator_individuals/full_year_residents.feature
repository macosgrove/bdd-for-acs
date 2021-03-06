Feature: Calculate individual taxes for full year residents

  In order to know how much more tax I have to pay
  As an Australian full year resident
  I want to calculate my net tax owing

  @javascript
  Scenario: Tax credits and medicare levy only
    Given I have started the latest comprehensive tax calculator
    And I am a Resident for the full year

    When my income details are:
      | Income type           | Amount  |
      | taxable income        | 134,200 |
      | reportable fringe ben | 5000    |
    And I choose to include the following tax calculation items:
      | Item              |
      | RefCreditsOffsets |
      | MedLevy           |
    And my tax credits are:
      | Credit type         | Amount |
      | PAYG installments   | 23000  |
      | Franking tax offset | 1200   |
    And I have no dependent children

    Then my tax estimates are expected to be:
      | Estimate type         | Amount     |
      | Tax on taxable income | $37,601.00 |
      | Medicare levy         | $2,684.00  |
      | Total tax payable     | $40,285.00 |
      | Net tax payable       | $16,085.00 |
