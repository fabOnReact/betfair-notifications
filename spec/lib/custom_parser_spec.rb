require 'spec_helper'

describe CustomParser do 
  describe 'custom_message module' do
    it 'includes custom_message constants' do 
      expect(CustomParser::BETFAIR_COMMAND).to eql("Usage: betfair COMMAND [OPTIONS]")
    end
  end
end
