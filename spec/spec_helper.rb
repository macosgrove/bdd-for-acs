Dir[File.join(File.dirname(__FILE__), "../lib" , "**.rb")].each do |file|
  require file
end

require 'rspec'
require 'rspec/mocks'
require 'pry'

RSpec.configure do |conf|
  conf.color = true
  conf.tty = true
end