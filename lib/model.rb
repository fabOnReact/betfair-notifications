class Model
  attr_reader :books, :filter, :catalog, :events, :targetPrice, :maxResults, :minutesInterval
  def initialize(client, parser)
    @client = client
    @filter = parser.filter
    @targetPrice = parser.targetPrice
    @minutesInterval = parser.minutesInterval
    @maxResults = parser.maxResults
  end

  def events; @events = @client.list_events({:filter => @filter}); end

  def books
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
