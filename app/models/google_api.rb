require 'httparty'

#understands making calls to the google search Api
module GoogleApi
  CX = "015171623030643194339%3Aan_mkvmr1ke"
  GOOGLE_KEY = Rails.application.secrets.google_key
  def search(term)
    time_before_search = Time.now
    response = HTTParty.get "https://www.googleapis.com/customsearch/v1?q=#{term}&cx=#{CX}&filter=1&num=5&searchType=image&key=#{GOOGLE_KEY}"
    response_time = ((Time.now - time_before_search) * 1000).to_i
    links = []
    response.parsed_response["items"].each do |item|
      links << item["link"]
    end
    return links, response_time
  end
  module_function :search
end
