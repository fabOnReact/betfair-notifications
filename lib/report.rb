class Report
  def initialize(model); @model = model; end
  def events_report
    tp events.flat_structure, :id, :name, :countryCode, :timezone, :marketCount
  end

  %w(events catalog books filter).each do |method|
    class_eval "def #{method}; @model.#{method}; end"
  end

  def runners; @runners = @model.runners; end
  # betfair book -m 1.149127014 
  def books_report
    raise ArgumentError, "MarketId is required to query the book api" if filter[:marketIds].nil?
    tp books, :marketId, :status, :totalMatched, :totalAvailable 
    runners_report if books.size == 1 && runners
  end

  def runners_report
    puts String.header("RUNNERS INFORMATION")
    @runners.each do |runner|
      runner.message
      puts String.header runner.message
      tp runner.lay_prices
    end
  end

  def catalog_report
    tp catalog, "marketId", "marketName", "totalMatched", "eventName" => lambda{|hash| hash['event']['name']}
  end

  # betfair monitor -m 1.149127014 -s 31162,10372411   
  def monitor
    # byebug
    raise ArgumentError, "Market and RunnerIds are required to monitor runners" if filter[:marketIds].nil? || filter[:selectionIds].nil?
    # ensure books is updates 
    puts "Level Reached!" if notify? 
    puts "some message"
    byebug
  end
  
  def notify?; filter[:targetPrice] <= max_price; end
  def max_price;
    # byebug; 
    books.first["runners"].filter_by(selection_id).to_lay; end
  def selection_id; filter[:selectionIds].first.to_i; end
end
