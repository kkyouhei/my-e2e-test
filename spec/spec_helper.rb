require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'capybara'
require 'capybara/webkit'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'turnip'
require 'turnip/capybara'
require 'selenium/webdriver'

RSpec.configure do |config|
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  ua = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25'
  profile["general.useragent.override"] = ua
  opts = { browser: :firefox, profile: profile }
  Capybara::Selenium::Driver.new app, opts
end

if (ENV['TARGET'].nil? || ENV['TARGET'] != 'poltergeist')
  Capybara.default_driver = :selenium
else
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

Dir.glob("spec/**/*steps.rb") { |f| load f, true }
