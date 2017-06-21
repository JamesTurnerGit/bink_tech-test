require 'httparty'

#understands making calls to the google search Api
module GoogleApi
  CX = Rails.application.secrets.cx
  GOOGLE_KEY = Rails.application.secrets.google_key
  RESPONSE_CLASS = Response

  def search(noun, colour)
    response, response_time = http_request noun,colour
    error_check response
    links = parse_result response
    date, time = parse_time
    RESPONSE_CLASS.new noun, colour, links, response_time, date, time
  end

  private

  def self.error_check response
    code = response.code
    return if code == 200
    error = response.parsed_response["error"]["errors"][0]
    raise "google api error #{code}: #{error}"
  end

  def self.parse_time
    time_stamp =Time.now
    time = time_stamp.strftime("%H:%M:%S")
    date = time_stamp.strftime("%d/%m/%Y")
    return date, time
  end

  def self.http_request noun,colour
    time_before_search = Time.new
    response = HTTParty.get "https://www.googleapis.com/customsearch/v1?q=#{noun}%20#{colour}&cx=#{CX}&filter=1&num=5&searchType=image&key=#{GOOGLE_KEY}"
    response_time = ((Time.now - time_before_search) * 1000).to_i
    return response,response_time
  end

  def self.parse_result response
    response.parsed_response["items"].map do |item|
      item["link"]
    end
  end

  module_function :search
end
