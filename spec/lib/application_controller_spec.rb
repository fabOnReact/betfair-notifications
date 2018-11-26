require 'spec_helper'

describe ApplicationController do 
  let(:custom_parser) { FactoryBot.build(:monitor_parser) }
  let(:application_controller) { ApplicationController.new("any input", custom_parser) } 

  describe '#handle_input' do 
  end
end
