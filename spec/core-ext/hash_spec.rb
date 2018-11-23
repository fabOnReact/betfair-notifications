require 'spec_helper'

describe Hash do 
  describe '#event_format' do
    it 'returns the flattened hash' do 
      expect({"event" => {'key' => '1'},'marketCount' => '2'}.event_format).to eql({"key"=>"1", "marketCount"=>"2"})
    end
  end

 describe '#lay_prices' do 
   it 'return amount and price 0' do
     hash = {'ex'=>{'availableToLay' => [{'price' => 0, 'size' => 0}, {prices: 2, size: 20}]}}
     expect(hash.lay_prices).to eql([{'price' => 0, 'size' => 0}, {prices: 2, size: 20}])
   end
 end
end

