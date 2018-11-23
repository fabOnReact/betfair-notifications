require 'spec_helper'

describe String do
  describe '.header' do 
    it 'create a string of header' do 
      expect(String.header("title").size).to be 81 
    end
  end
end
