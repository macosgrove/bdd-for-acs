FULL_YEAR_RESIDENT = '5265736964656E74'
YES = '596573'

Given(/^I have started the latest comprehensive tax calculator$/) do
  visit('/Calculators-and-tools/Comprehensive-tax-calculator')
  click_link('Comprehensive tax calculator 2014')
  switch_to_new_window
  submit_form(:last)
end

And(/^I am a Resident for the full year$/) do
  # We are using the radio input's name here, because the label has not been connected to the input with a 'for=' attribute
  # If you had control over the page it would be better to connect the label to the input field correctly, then the line below would be `choose 'Resident for the full year' `
  choose_by_value(FULL_YEAR_RESIDENT)
  submit_form(:last)
end

When(/^my income details are:$/) do |table|
  table.hashes.each do |row|
    page.fill_in(income_details_field_name(row['Income type']), with: row['Amount'])
  end
  submit_form(:last)
end

And(/^I choose to include the following tax calculation items:$/) do |table|
  table.hashes.each do |row|
    choose_by_name_and_value("XO_10_#{row['Item']}", YES)
  end
  submit_form(:last)
end

And(/^my tax credits are:$/) do |table|
  table.hashes.each do |row|
    page.fill_in(tax_credits_field_name(row['Credit type']), with: row['Amount'])
  end
  submit_form(:last)
end

Then(/^my tax estimates are expected to be:$/) do |table|
  # table is a table.hashes.keys # => [:Tax on taxable income, :37601.00]
  table.hashes.each do |row|
    expect(table_row_containing(row['Estimate type'])).to have_text(row['Amount'])
  end
end


