class CustomParser < OptionParser
  include CustomMessage
  attr_reader :filter, :maxResults
  def initialize
    super 
    @filter = {}; @maxResults = 1000
  end

  def capture_input h
    on(h[:key],h[:longKey],h[:text]) do |value|
      @filter[h[:field]] = value.split(',')
    end
  end
end
