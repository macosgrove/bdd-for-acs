And(/^I am a Resident for the full year$/) do
  pending
end

When(/^my income details are:$/) do |table|
  # table is a table.hashes.keys # => [:Income type, :amount]
  pending
end

And(/^my tax credits are:$/) do |table|
  # table is a table.hashes.keys # => [:PAYG installments, :23000]
  pending
end

Then(/^my tax estimates are expected to be:$/) do |table|
  # table is a table.hashes.keys # => [:Tax on taxable income, :37601.00]
  pending
end
