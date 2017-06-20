require 'httparty'

#understands making calls to the google search Api
module GoogleApi
  CX = Rails.application.secrets.cx
  GOOGLE_KEY = Rails.application.secrets.google_key
  RESPONSE_CLASS = Response
  def search(noun, colour)
    time_before_search = Time.new
    response = HTTParty.get "https://www.googleapis.com/customsearch/v1?q=#{noun}%20#{colour}&cx=#{CX}&filter=1&num=5&searchType=image&key=#{GOOGLE_KEY}"
    response_time = ((Time.now - time_before_search) * 1000).to_i
    links = parse_result response
    RESPONSE_CLASS.new noun, colour, links, response_time
  end

  private
  def self.parse_result response
    response.parsed_response["items"].map do |item|
      item["link"]
    end
  end

  module_function :search
end
