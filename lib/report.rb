class Report
  include ErrorMessage
  attr_reader :counter
  def initialize(model); @model = model; @counter = 0; end
  def events_report
    tp events.flat_structure, :id, :name, :countryCode, :timezone, :marketCount
  end

  %w(events catalog books filter maxResults targetPrice minutesInterval logMessage).each do |method|
    class_eval "def #{method}; @model.#{method}; end"
  end

  def runners; @runners = @model.runners; end
  # betfair book -m 1.149127014 
  def books_report
    raise ArgumentError, BOOK_PARAMS  if filter[:marketIds].nil?
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

  # betfair monitor -m 1.149127014 -s 31162 -t 5 -i 3
  def monitor
    raise ArgumentError, MONITOR_PARAMS if monitor_params_present?
    puts "report#monitor called"
    level_reached if notify?
  end

  def level_reached 
    puts "Price Level Reached!" 
    books_report
  end

  def monitor_params_present?
    filter[:marketIds].nil? || filter[:selectionIds].nil? || targetPrice.nil? || maxResults.nil?
  end

  def notify?; 
    # @counter +=1;
    # targetPrice <= max_price; 
    # if @counter == 0; return true; else; return false;end
    true
  end
  def max_price; books.first["runners"].filter_by(selection_id).lay_prices.maximum; end
  def selection_id; filter[:selectionIds].first.to_i; end
end
