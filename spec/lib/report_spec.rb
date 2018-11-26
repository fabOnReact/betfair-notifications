require 'spec_helper'

describe Report do 
  let(:client) { FactoryBot.build(:client) }
  let(:model) { FactoryBot.build(:model) }
  let(:report) { FactoryBot.build(:report) }

  describe '#books' do 
    let(:model) { FactoryBot.build(:books_model) }
    let(:report) { Report.new(model) } 
    it 'retrieve the books' do
      expect(report.books.size).to be 1 
      expect(report.books.first["marketId"]).to eql("1.149127014")
      expect(report.books.first["runners"].first["selectionId"]).to eql 20973239
    end
  end

  describe '#monitor' do 
    # let(:custom_parser) { FactoryBot.build(:custom_parser, filter: {marketIds: ['1'], selectionId: '2', targetPrice: 4, minutesInterval: 4}) }
    let(:custom_parser) { FactoryBot.build(:monitor_parser) }
    let(:model) {  Model.new(client, custom_parser) }
    let(:report) { Report.new(model) } 

    describe '#notify?' do
      it 'compares the prices to the target' do
        books = double('books') 
        allow(client).to receive(:list_market_book).and_return(books)
        allow(report).to receive(:max_price).and_return(5)
        allow(model).to receive(:targetPrice).and_return(4)
        report.books
        expect(report.notify?).to be true
      end
    end
  end
end
