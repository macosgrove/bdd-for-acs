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

## References

* [Cucumber](http://cukes.info)
* [Capybara](http://github.com/jnicklas/capybara) (for actions such as click_link, click_button, etc...)

