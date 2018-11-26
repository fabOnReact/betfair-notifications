PROJECT_ROOT = File.expand_path("../..", __FILE__)
# $LOAD_PATH << PROJECT_ROOT

require 'active_support/all'
require 'factory_bot'
require 'byebug'
require 'optparse'
require 'betfair'
require_relative '../lib/concerns/parser_message'
require_relative '../lib/concerns/error_message'
Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each {|file| require_relative file }
Dir.glob(File.join(PROJECT_ROOT, "lib", "core_ext", "*.rb")).each {|file| require_relative file }

HTTPI.log = false
ENV['two_factor'] = ''

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
