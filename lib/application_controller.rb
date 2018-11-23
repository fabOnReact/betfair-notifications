class ApplicationController
  def initialize(input, parser)
    @client = Client.new(ENV['BETFAIR_EMAIL'],ENV['BETFAIR_PW'], ENV['BETFAIR_APPLICATION_CODE'])
    @model = Model.new(@client, parser)
    handle_input input, parser
  end

  def handle_input input, parser
    case input
    when "events"
      Report.new(@model).events_report
    when 'catalog'
      Report.new(@model).catalog_report
    when 'book'
      Report.new(@model).books_report
    when 'monitor'
      # @report = Report.new(@model)
      ReportJob.perform_async(@model)
    else
      puts parser
    end
  end
end
