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
      report = Report.new(@model).monitor
      fork do
        Process.setsid
        sleep parser.filter[:minutesInterval].minutes
        # report.monitor
        puts "In daemon"
      end
    else
      # byebug
      puts parser
    end
  end
end
