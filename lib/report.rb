class Report
  include ErrorMessage
  attr_accessor :display
  def initialize(model); @model = model; @counter = 1; end
  def events_report
    puts ''
    # raise StandardError, "Api error #{events['errorCode']} description #{events['errorDetails']}" if events['faultcode'].present?
    # tp events.flat_structure, :id, :name, :countryCode, :timezone, :marketCount
  end

  %w(events catalog books filter maxResults targetPrice minutesInterval logMessage).each do |method|
    class_eval "def #{method}; @model.#{method}; end"
  end

  def runners; @runners = @model.runners; end
  # betfair book -m 1.149127014 
  def books_report
    sleep 4
    puts ''
    puts 'events report method called'
    puts "parameters are minutesInterval #{minutesInterval} and targetPrice #{targetPrice}"
    # raise ArgumentError, BOOK_PARAMS  if filter[:marketIds].nil?
    # tp books, :marketId, :status, :totalMatched, :totalAvailable 
    # runners_report if books.size == 1 && runners
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
    loop do 
      # sleep 2
      if notify? 
        books_report 
        exit
      end
    end
    # raise ArgumentError, MONITOR_PARAMS if monitor_params_present?
    # puts "report#monitor called"
    # level_reached if notify?
  end

  def monitor_params_present?
    filter[:marketIds].nil? || filter[:selectionIds].nil? || targetPrice.nil? || maxResults.nil?
  end

  def notify?; @counter += 1; # targetPrice <= max_price;
    @counter == 3; end
  # def notify?; true; end
  def max_price; books.first["runners"].filter_by(selection_id).lay_prices.maximum; end
  def selection_id; filter[:selectionIds].first.to_i; end
end
