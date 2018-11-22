PROJECT_ROOT = File.expand_path("../..", __FILE__)
$LOAD_PATH << PROJECT_ROOT

require 'active_support/all'
require 'factory_bot'
require 'byebug'
require 'optparse'
require 'betfair'
require 'lib/concerns/custom_message'
Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each {|file| require file }

HTTPI.log = false

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
