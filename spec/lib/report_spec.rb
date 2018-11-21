require 'spec_helper'
require 'report'

describe Report do 
  let(:client) { FactoryBot.build(:client) }
  let(:model) { FactoryBot.build(:model) }
  let(:report) { FactoryBot.build(:report) }

  describe 'attr_readers' do 
    it ''
  end

  describe '#books' do 
    let(:model) { Model.new(client, {marketIds: ['1.149127014']}, 1000) }
    let(:report) { Report.new(model) } 
    it 'retrieve the books' do
      expect(report.books.size).to be 1 
      expect(report.books.first["marketId"]).to eql("1.149127014")
      expect(report.books.first["runners"].first["selectionId"]).to eql 20973239
    end
  end

  describe '#monitor' do 
    let(:model) { Model.new(client, {marketIds: ['1'], selectionId: '2', targetPrice: 4, minutesInterval: 4}, 1000) }
    let(:report) { Report.new(model) }

    it 'repeat the call until the target is reached'
    #   t1 = double('t1'); t2 = double('t2');
    #   expect(report.notify?).to be false
    # end

    describe '#notify?' do
      it 'compares the prices to the target' 
      #   books = double('books') 
      #   allow(client).to receive_message_chain(:list_market_book).and_return(books)
      #   allow(report).to receive(:max_price).and_return(5)
      #   report.books
      #   expect(report.notify?).to be true
      # end
    end
  end
end
