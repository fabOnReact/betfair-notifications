# CustomMessage module includes only text
module ParserMessage
  attr_accessor :filter, :maxResults
  BETFAIR_CMD = %(Usage: betfair COMMAND [OPTIONS])
  EVENTS_CMD_DESCRIPTION = "    events: Returns a list of Events (i.e, Reading vs. Man United) associated with the markets selected by the MarketFilter. example: betfair events available options" 
  CATALOG_CMD_DESCRIPTION = '    catalog: Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely). You use listMarketCatalogue to retrieve the name of the market, the names of selections and other information about markets.  Market Data Request Limits apply to requests made to listMarketCatalogue. Please note: listMarketCatalogue does not return markets that are CLOSED. example: betfair catalog'  
  BOOK_CMD_DESCRIPTION = '    book: Returns a list of dynamic data about markets. Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market. Please note: Separate requests should be made for OPEN & CLOSED markets. Request that include both OPEN & CLOSED markets will only return those markets that are OPEN.'
  EVENTS_COUNTRY_OPT = "Restrict to markets that are in the specified country or countries. Use with two digits countrycode separated by comma. example: betfair events -c IT,UK"
  EVENTS_TEXT_OPT = "use with any text to restrict search to Name, Event, Competition, etc. You can include a wildcard (*) character as long as it is not the first character. example: betfair events -q Brazil"
  EVENTS_IDS_OPT = '    -e, --eventIds                   IDs Restrict markets by the event id associated with the market. Numeric arguments separated by comma. example: betfair events -e 28963077,28988963'
  CATALOG_INTEGER_OPT = 'Limit on the total number of results returned, must be greater than 0 and less than or equal to 1000. example: betfair catalog -r 90'
  CATALOG_MARKET_OPT = '    -m, --marketIds IDs              Restrict markets by the market id associated with the market. Numeric arguments separated by comma. example: betfair catalog -m 1.145994605,1.150593750'
  CATALOG_EVENT_OPT = 'Restrict markets by the event id associated with the market. Numeric arguments separated by comma. example: betfair catalogue -e 28963077,28988963'
  BOOK_MARKET_OPT = 'Restrict markets by the market id associated with the market. Numeric arguments separated by comma. example: betfair book -m 1.145994605,1.150593750' 
  MONITOR_EVENTS_OPT = '    -m, --marketIDs                  IDs Restrict markets by the event id associated with the market. Numeric arguments separated by comma. example: betfair events -e 28963077,28988963'
  MONITOR_SELECTION_OPT = 'Restrict markets by the unique id for the selection. Numeric arguments separated by comma. example: betfair monitor -s 31162'
  EVENTS_COUNTRIES = {key: "-c",longKey: "--countries COUNTRIES",text: EVENTS_COUNTRY_OPT, field: :marketCountries}
  EVENTS_TEXT = {key: '-q',longKey: '--textQuery TEXT',text: EVENTS_TEXT_OPT, field: :textQuery}
  CATALOG_RESULTS = {key: '-x',longKey: '--maxResults INTEGER',text: CATALOG_INTEGER_OPT, field: :maxResults}
  CATALOG_EVENTS = {key: '-e',longKey: '--eventIds IDs',text: CATALOG_EVENT_OPT, field: :eventsIds}  
  BOOK_MARKET = {key: '-m',longKey: '--marketIds IDs',text: BOOK_MARKET_OPT, field: :marketIds} 
  MONITOR_SELECTION = {key: '-s',longKey: '--selectionIDs IDs',text: MONITOR_SELECTION_OPT, field: :selectionIds}
  MONITOR_TARGET_OPT = 'Target price at which the program will trigger an alert. Numeric argument. example: betfair monitor -t 5'
  MONITOR_TARGET = {key: '-t',longKey: '--targetPrice INTEGER',text: MONITOR_TARGET_OPT, field: :targetPrice}
  MONITOR_MINUTES_OPT = 'Minutes Interval for monitoring prices. Numeric argument. example: betfair monitor -i 5'
  MONITOR_MINUTES = {key: '-i',longKey: '--minutesInterval INTEGER',text: MONITOR_MINUTES_OPT, field: :minutesInterval}
  # EVENTS_PARSER = [EVENTS_COUNTRIES, EVENTS_TEXT]
  CMD_DESCRIPTIONS = [EVENTS_CMD_DESCRIPTION, CATALOG_CMD_DESCRIPTION, BOOK_CMD_DESCRIPTION]
end
