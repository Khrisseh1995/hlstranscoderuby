require "httparty"

module Fetch
  #Fetch a given file from a URL
  def self.fetch(url)
    begin
      response = HTTParty.get(url)
      body = response.parsed_response
      return body
    rescue HTTParty::Error
      raise Exception.new "Failed to retrieve playlist url"
    end
  end
end
