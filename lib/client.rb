class Client < Betfair::Client
  def initialize(username, password, application_code)
    super('X-Application' => application_code)
    interactive_login(username, password) 
  end
end
