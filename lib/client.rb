class Client < Betfair::Client
  def initialize(username, password, application_code)
    # puts 'intialize client'
    # super({'X-Application' => application_code})
    # interactive_login(username, password) 
  end
end
