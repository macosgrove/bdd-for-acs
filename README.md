# Behaviour Driven Development: Powering Your Agile Project with Cucumber and Ruby

This project is a companion to a presentation for the Australian Computer Society

## Structure

* features/*.feature : cucumber features
* features/step_definitions/web_steps.rb : generic steps that apply to all features
* features/step_definitions/[feature]_steps.rb : steps specific to an individual feature file
* support/env.rb : configures the driver and the hostname to use

## Prerequisites

* Ruby http://www.ruby-lang.org/en/downloads/
* Ruby Gems http://rubygems.org/
* Bundler: sudo gem install bundler rake

## Configuration

* sudo bundle install

## Running Features

* To run all features: cucumber
* To run a specific feature: cucumber features/tax_calculator_individuals/full_year_residents.feature
* To run a specific scenario within a feature: cucumber features/tax_calculator_individuals/full_year_residents.feature:24

## Debugging

* The @javascript tag makes the test run in a browser so you can see what's happening. Remove it to run headless.
* This project includes debugging helpers: 
  * Add the step 'And I debug' to open the pry console from a feature
  * Add the method 'debug' to open the pry console from a step
  * 

## References

* [Cucumber](http://cukes.info)
* [Capybara](http://github.com/jnicklas/capybara) (for actions such as click_link, click_button, etc...)

