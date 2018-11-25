require 'spec_helper'

describe Array do
  let(:array) { [{"event" => {'key' => '1'},'marketCount' => '2'},{"event" => {'key' => '1'},'marketCount' => '2'}] }
  describe '#flat_structure' do 
    it 'returns a flattened result' do 
      expect(array.flat_structure).to eql([{'key' => '1','marketCount' => '2'},{'key' => '1','marketCount' => '2'}])
    end
  end

  describe '#filter_by' do 
    it 'returns the correct selection' do
      array = [{"selectionId" => 1, "b" => 11},{"selectionId": 2, "b" => 1}]
      expect(array.filter_by(1)).to eql({"selectionId"=>1, "b"=>11})
    end
  end
  
  describe '#maximum' do 
    it 'returns the maximum price' do
      array = [{'price' => 2, 'a' => 3},{'price' => 1, 'a' => 2}, {'price' => 10, 'a' => 0}]
      expect(array.maximum).to be 10 
    end
  end
end

