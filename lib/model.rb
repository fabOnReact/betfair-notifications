class Model
  attr_reader :books, :filter, :catalog, :events
  def initialize(client, custom_parser)
    @client = client
    @filter = custom_parser.filter
    @maxResults = custom_parser.maxResults
  end

  def events; @events = @client.list_events({:filter => @filter}); end

  def books
    puts "@books variable is updated"
    @books = @client.list_market_book(@filter.merge_projections!)
  end

  def runners; @runners = @books.first["runners"]; end

  def catalog_filter
    @filter.merge!({marketTypeCodes: ["MATCH_ODDS"]})
  end
  
  def catalog
    @catalog = @client.list_market_catalogue({:filter => catalog_filter,:maxResults => @maxResults,:marketProjection => ["RUNNER_DESCRIPTION","EVENT"]})
  end
end
