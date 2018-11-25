class CustomParser < OptionParser
  EXCEPTIONS = [:maxResults, :targetPrice, :minutesInterval]
  include ParserMessage
  attr_reader :filter, :maxResults, :targetPrice, :minutesInterval
  def initialize
    super 
    @filter = {}; @maxResults = 1000
  end

  def capture_input(hash,&block)
    on(hash[:key],hash[:longKey],hash[:text]) do |value|
      if EXCEPTIONS.include? hash[:field]  
        var = "@#{hash[:field]}".to_sym; instance_variable_set(var, value.to_i)
      else; @filter[hash[:field]] = (block_given? ? yield(value) : value); end
    end
  end

  # def events_options; EVENTS_PARSER.each {|settings| capture_input settings}; end
end
