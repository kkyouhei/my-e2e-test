require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'capybara'
require 'capybara/webkit'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'turnip'
require 'turnip/capybara'

RSpec.configure do |config|

end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

if (ENV['TARGET'].nil? || ENV['TARGET'] != 'poltergeist')
  Capybara.default_driver = :selenium
else
  require 'capybara/poltergeist'
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

Dir.glob("spec/**/*steps.rb") { |f| load f, true }
