module Helpers

  def debug
    # This opens the Pry console. I've included pry-byebug, which gives stepping commands n=next in this method, s=step into called method, c=continue etc.
    require 'pry'
    binding.pry
  end

  def switch_to_new_window
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  end

  def submit_form(which)
    # It would be preferable to have a button on the form you could click to submit. This is a workaround for times when you can't modify the page.
    case which
    when :first
      index = 0
    when :last
      index = 'forms.length-1'
    else
      index = "#{which}"
    end
    # I would prefer to use jQuery selectors, but for times when jQuery is not included and you can't modify the page, this uses pure javascript
    page.execute_script("forms = document.querySelectorAll('form'); forms[#{index}].submit()")
  end

  def choose_by_value(value)
    page.find("input[value='#{value}']").click
  end

  def choose_by_name_and_value(name, value)
    page.find("input[name='#{name}'][value='#{value}']").click
  end

  def income_details_field_name(suffix)
    "XO_4_#{suffix.gsub(' ', '_')}"
  end

  def tax_credits_field_name(readable_name)
    names = ['0-NA', 'PAYG installments', 'Total credits from summaries', 'Credit for tax withheld', 'Other tax withheld', 'Voluntary agreement', 'Labour hire', 'TFN amounts withheld', 'Early payment interest', 'Other offsets', 'Franking tax offset', 'Foreign resident withholding', 'Rental affordability']
    "XO_4_refundable#{names.index(readable_name)}"
  end

  def table_row_containing(text)
    page.all("tr", :text => text, exact: true).last
  end

end

After do |scenario|
  save_and_open_page if scenario.failed?
end

World(Helpers)