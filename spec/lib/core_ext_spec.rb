require 'spec_helper'
require 'core_ext'

describe Array do
  let(:array) { [{"event" => {'key' => '1'},'marketCount' => '2'},{"event" => {'key' => '1'},'marketCount' => '2'}] }
  describe '#flatten_results' do 
    it 'returns a flattened result' do 
      expect(array.flat_structure).to eql([{'key' => '1','marketCount' => '2'},{'key' => '1','marketCount' => '2'}])
    end
  end
end

describe Hash do 
  describe '#flatten_hash' do
    it 'returns the flattened hash' do 
      expect({"event" => {'key' => '1'},'marketCount' => '2'}.event_format).to eql({"key"=>"1", "marketCount"=>"2"})
    end
  end

  describe '#runners_format' do 
    it 'returns a hash with selected params' do 
      class Hash; def filter_fields(index);{"b1" => 1, "b2" => 2};end;end
      hash = {"a" => 1, "runners" => [{"b" => 1},{"b" => 2}]}
      expect(hash.runners_format).to eql({"a"=>1, "b1"=>1, "b2"=>2})
    end

    describe '#to_lay' do 
      it 'return amount and price 0' do
        hash = {'ex'=>{'availableToLay' => []}}
        expect(hash.lay_hash).to eql({'price' => 0, 'size' => 0})
      end
    end

    describe '#filter_fields' do 
      it 'return a hash with 3 keys' do 
        hash = {'id' => 1, 'ex' => {'availableToBack' => [{'price' => 1.01, 'size' => 23.01}], 'availableToLay'=>[{'price' => 4, 'size' => 10}]}}
        result = {:runnerId1=>1, :layPrice1=>4, :laySize1=>10}
        expect(hash.filter_fields(1)).to eql(result) 
      end
    end
  end
end
