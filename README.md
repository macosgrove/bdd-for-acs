# Behaviour Driven Development: Powering Your Agile Project with Cucumber and Ruby

This project is a companion to a [presentation](http://prezi.com/dhe2aqr3x2wq/?utm_campaign=share&utm_medium=copy) for the Australian Computer Society.
During the presentation we imagine we are a team tasked with updating the Australian Tax Office's [Tax Calculator](https://www.ato.gov.au/Calculators-and-tools/Comprehensive-tax-calculator). This project demonstrates how Cucumber, Ruby, Capybara and RSpec might help with that.

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

## Debugging Features

* The @javascript tag makes the test run in a browser so you can see what's happening. Remove it to run headless.
* This project includes debugging helpers: 
  * Add the step 'And I debug' to open the pry console from a feature
  * Add the method 'debug' to open the [pry console](http://pryrepl.org/) with [byebug](https://github.com/deivid-rodriguez/pry-byebug) from a step

## Running Unit Tests

* To run all tests: rspec
* To run a specific test: rspec ./spec/tax_calculator_spec.rb:71

## Debugging Unit Tests
* Add 'binding.pry' to open the [pry console](http://pryrepl.org/) with [byebug](https://github.com/deivid-rodriguez/pry-byebug) from a spec

## More about BDD from me
* [The Presentation](http://prezi.com/dhe2aqr3x2wq/?utm_campaign=share&utm_medium=copy)
* [Transcript of the Presentation](transcript.md)
* [Making the Most of BDD](http://webuild.envato.com/blog/making-the-most-of-bdd-part-1/)
* [BDD with Android](http://prezi.com/78y82u9ld2yy/?utm_campaign=share&utm_medium=copy) (Android Bootcamp week 2)
* [Behaviour Driven Development in Android Studio](http://prezi.com/fxxkpgakbivh/?utm_campaign=share&utm_medium=copy) (a presentation given at the Sydney Android Developers Group) 

## Other References

* [Cucumber](http://cukes.info), [Cucumber Platforms](https://cukes.info/platforms.html) and [Cucumber Backgrounder](https://github.com/cucumber/cucumber/wiki/Cucumber-Backgrounder)
* [Ruby]
* [RSpec]
* [Installation on Windows](http://www.spritecloud.com/2011/04/complete-setup-guide-for-ruby-cucumber-and-watir-or-selenium-on-windows/)
* [Installation on MAC](https://mayxu.wordpress.com/2012/04/17/complete-mac-setup-guide-for-rubycucumberwatirselenium-12/)
* [Capybara](http://github.com/jnicklas/capybara) (for actions such as click_link, click_button, etc...)

* [Java Functional Testing with JRuby and RSpec](http://pivotallabs.com/functional-tests-for-java-project-rspec-story-framework-jruby/) Pivotal Labs

* [Test Driven Development](http://www.amazon.com/Test-Driven-Development-By-Example/dp/0321146530) Kent Beck 2002
* [Behaviour Driven Development](http://dannorth.net/introducing-bdd/) Dan North 2006

