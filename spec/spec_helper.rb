ENV['RAILS_ENV'] = 'test'

redmine_root = ENV['REDMINE_ROOT'] || File.dirname(__FILE__) + '/../../..'
require File.expand_path redmine_root + '/config/environment'

require 'rspec'
require 'rspec/mocks'
require 'rspec/rails'
require 'shoulda-matchers'
require 'faker'
require 'factory_girl'
FactoryGirl.definition_file_paths = [File.dirname(__FILE__) + '/factories']
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = true
  config.filter_run :focus

  config.mock_with :rspec

  config.order = 'random'
end
