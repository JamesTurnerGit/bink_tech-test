#understands who to ask to make searches and how to store/retrieve them
class Searches
  attr_reader :searches

  def initialize (search_api = GoogleApi, response_class = Response)
    @searches = []
    @search_api = search_api
    @response_class = response_class
  end

  def new_search colour, noun
    result,response_time = search_api.search("#{colour} #{noun}")
    @searches << response_class.new(colour, noun, result, response_time)
  end

  def self.instance
    @@instance
  end

  def latest_search
    return nil if searches.empty?
    searches.last.results
  end

  def previous_searches
    return nil if searches.length < 2
    searches[-2..0]
  end

  attr_reader :search_api, :response_class
  @@instance = Searches.new
end
