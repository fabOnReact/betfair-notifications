class Model
  attr_reader :books
  def initialize(client, filter, results)
    @client = client
    @filter = filter
    @maxResults = results
  end

  def events; @events = @client.list_events({:filter => @filter}); end

  def books
    @books = @client.list_market_book(@filter.merge_projections!)
  end

  def runners; @runners = @books.first["runners"]; end
end
