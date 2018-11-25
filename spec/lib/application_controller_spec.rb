require 'spec_helper'

describe ApplicationController do 
  let(:custom_parser) { FactoryBot.build(:monitor_parser) }
  let(:application_controller) { ApplicationController.new("any input", custom_parser) } 

  describe '#handle_input' do 
    context 'monitor' do 
      it 'triggers the alert' do 
        class ApplicationController; attr_reader :model; end
        books = double("books")
        allow_any_instance_of(Report).to receive(:monitor).and_return(books)
        allow(books).to receive_message_chain(:first, :[], :filter_by, :to_lay).and_return(4)
        expect(application_controller.handle_input("monitor", custom_parser)).to eql ""
      end
    end
  end
end
