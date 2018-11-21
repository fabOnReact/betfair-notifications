PROJECT_ROOT = File.expand_path("../..", __FILE__)

require 'factory_bot'
require 'byebug'
require 'optparse'
require 'betfair'
# require_relative '../lib/client.rb'

Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
  require file
end

HTTPI.log = false

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
