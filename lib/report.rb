class Report
  def initialize(client, filter)
    @client = client
    @filter = filter
  end

  def events(filter)
    events = @client.list_events({:filter => filter})
    tp events.flat_structure, :id, :name, :countryCode, :timezone, :marketCount
  end

  def books
    @books = @client.list_market_book(@filter.merge_projections!)
  end

  def books_report
    # betfair book -m 1.149127014 
    raise ArgumentError, "MarketId is required to query the book api" if @filter[:marketIds].nil?
    tp books, :marketId, :status, :totalMatched, :totalAvailable 
    runners_report if @books.size == 1 && @runners = @books.first["runners"]
  end

  def runners_report
    puts String.line("RUNNERS INFORMATION")
    @runners.each do |runner|
      puts String.line("selection id #{runner['selectionId']}")
      tp runner["ex"]["availableToLay"]
    end
  end

  def catalog(filter, maxResult)
    filter.merge!({marketTypeCodes: ["MATCH_ODDS"]})
    result = @client.list_market_catalogue({:filter => filter,:maxResults => maxResult,:marketProjection => ["RUNNER_DESCRIPTION","EVENT"]})
    tp result, "marketId", "marketName", "totalMatched", "eventName" => lambda{|hash| hash['event']['name']}
  end

  def monitor(filter)
    # betfair monitor -m 1.149127014 -s 31162,10372411   
    raise ArgumentError, "Market and RunnerIds are required to monitor runners" if filter[:marketIds].nil? || filter[:selectionIds].nil?
    puts books
  end
end
