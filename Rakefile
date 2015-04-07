require 'rspec/core/rake_task'

namespace :mytest do
  begin
    [:selenium, :poltergeist].each do |target|
      RSpec::Core::RakeTask.new(target) do |spec|
        ENV['TARGET']   = target.to_s
        spec.pattern    = 'spec/**/*_spec.rb'
        spec.rspec_opts = ['-c', '-f d']
      end
    end
  rescue LoadError => e
    exit
  end

end

task :default => "mytest:selenium"
