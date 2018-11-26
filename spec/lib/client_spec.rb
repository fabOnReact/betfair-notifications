require 'spec_helper'

describe Client do
  let(:client) { Client.new(ENV['BETFAIR_EMAIL'],ENV['BETFAIR_PW'], ENV['BETFAIR_APPLICATION_CODE']) }
  describe '#initialize' do
    it 'create a client instance' do
      expect(client).to be_instance_of(Client)
    end

    it 'perform the interactive login' do 
      expect(client.persistent_headers["X-Authentication"]).to be_present
    end

    it 'perform the interactive login' do 
      expect(client.persistent_headers["X-Authentication"]).to be_present
    end
  end

  describe '#list_market_catalogue' do
    it "should retrieve the list of market catalogue" do
      market_catalogue = client.list_market_catalogue({ filter: {marketIds: ['1.145994605']}, maxResults: 200}).first
      expect(market_catalogue).to_not be_empty
      expect(market_catalogue["marketId"]).to eql('1.145994605')
      expect(market_catalogue.size).to be(3)
    end 

    # fix this test case
    it "should retrieve the list of market catalogue" do
      market_catalogue = client.list_market_catalogue({ filter: {eventIds: ['28963077']}, marketProjection: ['EVENT'], maxResults: 200})
      expect(market_catalogue[0]["event"]["id"]).to eql('28963077')
    end 

    it "should return the runners names" do 
      market_catalogue = client.list_market_catalogue({ filter: {marketTypeCodes: ["MATCH_ODDS"]}, marketProjection: ["RUNNER_DESCRIPTION"], maxResults: 2})
      expect(market_catalogue.first["marketName"]).to eql("Match Odds")
      expect(market_catalogue.first["runners"].size).to be 3
      expect(market_catalogue.first["runners"].first).to be_present 
    end
  end

  describe '#list_market_book' do 
    it 'should return the price at best_offer' do
      market_book = client.list_market_book({marketIds: ["1.149779036"], priceProjection: {priceData: ["EX_BEST_OFFERS"]}}).first
      expect(market_book["marketId"]).to eql("1.149779036")
      expect(market_book["runners"].size).to be 3 
      expect(market_book["runners"].first['ex'].keys).to eql(["availableToBack", "availableToLay", "tradedVolume"])
    end
  end

  describe '#list_events' do 
    it 'should retrieve a list the events' do
      events = client.list_events({filter: {}})
      expect(events).to_not include({"faultcode"=>"Client"})
      expect(events.size).to be > 1
    end

    it 'filter events based on the countries' do
      german_events = client.list_events({filter: {marketCountries: ['DE']}})
      expect(german_events.first["event"]["countryCode"]).to eql("DE")
    end
  end
end
