class Data
  def initialize(client, filter, results)
    @client = client
    @filter = filter
    @maxResults = results
  end

  def events; @events = @client.list_events({:filter => @filter}); end

  def books
    @books = @client.list_market_book(@filter.merge_projections!)
  end

  def books_report
    # betfair book -m 1.149127014 
    raise ArgumentError, "MarketId is required to query the book api" if @filter[:marketIds].nil?
    tp books, :marketId, :status, :totalMatched, :totalAvailable 
    runners_report if @books.size == 1 && @runners = @books.first["runners"]
  end
end
