class Report
  def initialize(client, filter, results)
#    @client = client
#    @filter = filter
#    @maxResults = results
  end

  def events
    events = @client.list_events({:filter => @filter})
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

  def catalog
    @filter.merge!({marketTypeCodes: ["MATCH_ODDS"]})
    result = @client.list_market_catalogue({:filter => @filter,:maxResults => @maxResult,:marketProjection => ["RUNNER_DESCRIPTION","EVENT"]})
    tp result, "marketId", "marketName", "totalMatched", "eventName" => lambda{|hash| hash['event']['name']}
  end

  def monitor
    # betfair monitor -m 1.149127014 -s 31162,10372411   
    raise ArgumentError, "Market and RunnerIds are required to monitor runners" if @filter[:marketIds].nil? || @filter[:selectionIds].nil?
    loop do
      sleep @filter[:minutesInterval].minutes
      books
    end
  end
  
  def verify_prices; 
  end 

  def notify?; @filter[:targetPrice] <= max_price; end
  def max_price; @books.first["runners"].filter_by(selection_id).to_lay; end
  def selection_id; @filter[:selectionId].to_i; end
end
