class Client < Betfair::Client
  def initialize(username, password, application_code)
    super({'X-Application' => application_code})
    if ENV["two_factor"].present?
      non_interactive_login(username, password, ENV['cert_key_file_path'], ENV['cert_file_path'])
    else 
      interactive_login(username, password) 
    end
  end
end
