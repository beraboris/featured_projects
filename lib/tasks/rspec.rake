require 'rspec/core/rake_task'

namespace :redmine do
  namespace :plugins do
    namespace :featured_projects do
      desc 'Run all RSpec examples for plugin "featured_projects"'
      RSpec::Core::RakeTask.new :spec do |t|
        redmine_root = ENV['REDMINE_ROOT'] || File.dirname(__FILE__) + '/../../../..'
        t.rspec_opts = "-O #{File.expand_path(redmine_root+'/plugins/featured_projects/spec/rspec.opts')}"
        t.pattern = "#{File.expand_path(redmine_root+'/plugins/featured_projects/spec')}/**/*_spec.rb"
      end
    end
  end
end
