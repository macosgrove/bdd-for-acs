module Helpers

  def debug
    # This opens the Pry console. I've included pry-byebug, which gives stepping commands n=next in this method, s=step into called method, c=continue etc.
    require 'pry'
    binding.pry
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

end

After do |scenario|
  save_and_open_page if scenario.failed?
end

World(Helpers)