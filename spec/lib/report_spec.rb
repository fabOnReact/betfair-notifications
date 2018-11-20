require 'spec_helper'
require 'report'

describe Report do 
  let(:client) { Client.new(ENV['BETFAIR_EMAIL'],ENV['BETFAIR_PW']) }
  describe '#monitor' do 
    it 'retrieve the books' do

