Given(/^I have started the latest comprehensive tax calculator$/) do
  visit('/Calculators-and-tools/Comprehensive-tax-calculator')
  click_link('Comprehensive tax calculator 2014')
  submit_form(:last)
end

And(/^I choose to include the following tax calculation items:$/) do |table|
  # table is a table.hashes.keys # => [:tax credits]
  pending
end

