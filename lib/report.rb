class Report
  include ErrorMessage
  attr_accessor :display
  def initialize(model); @model = model; @counter = 1; end
  def events_report
    raise StandardError, "Api error #{events['errorCode']} description #{events['errorDetails']}" if events.is_a? Hash
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
    puts 
    tp catalog.first['runners'] if catalog.size == 1 
  end

  # betfair monitor -m 1.149127014 -s 31162 -t 5 -i 1
  def monitor
    raise ArgumentError, MONITOR_PARAMS if monitor_params_missing?
    loop do 
      sleep minutesInterval.minutes
      if notify? 
        books_report 
        exit
      end
    end
  end

  def monitor_params_missing?
    filter[:marketIds].nil? || filter[:selectionIds].nil? || targetPrice.nil? || maxResults.nil?
  end

  def notify?; targetPrice <= max_price; end
  def max_price; books.first["runners"].filter_by(selection_id).lay_prices.maximum; end 
  def selection_id; filter[:selectionIds].first.to_i; end
end
