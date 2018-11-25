require 'spec_helper'

describe CustomParser do 
  let(:custom_parser) { FactoryBot.build(:monitor_parser) }
  describe 'custom_message module' do
    it 'includes custom_message constants' do 
      expect(CustomParser::BETFAIR_CMD).to eql("Usage: betfair COMMAND [OPTIONS]")
    end
  end

  #describe '#capture_input' do 
  #  let(:custom_parser) { FactoryBot.build(:multiple_events) }
  #  it 'save the input as integer' do 
  #    byebug
  #    custom_parser.capture_input(CustomParser::CATALOG_EVENTS) #{|value| value.split(',')}
  #    expect(custom_parser.filter).to eql ""
  #  end
  #end
      # custom_parser CustomParser::BOOK_MARKET {|value| value.split(',')}
end
