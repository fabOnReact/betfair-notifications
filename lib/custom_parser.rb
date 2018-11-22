class CustomParser < OptionParser
  include CustomMessage
  attr_reader :filter, :maxResults
  def initialize
    super 
    @filter = {}; @maxResults = 1000
  end

  def capture_input(hash,&block)
    on(hash[:key],hash[:longKey],hash[:text]) do |value|
      if hash[:field] == :maxResults; @maxResults = value 
      else; @filter[hash[:field]] = (block_given? ? yield(value) : value); end
    end
  end

  def events_options; EVENTS_PARSER.each {|settings| capture_input settings}; end
end
