require 'httparty'
module GoogleApi
  CX = "015171623030643194339%3Aan_mkvmr1ke"
  GOOGLE_KEY = Rails.application.secrets.google_key
  def search(term)

    response = HTTParty.get "https://www.googleapis.com/customsearch/v1?q=#{term}&cx=#{CX}&filter=1&num=5&searchType=image&key=#{GOOGLE_KEY}"
    links = []
    response.parsed_response["items"].each do |item|
      links << item["link"]
    end
    links
  end
  module_function :search
end
