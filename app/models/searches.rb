#understands who to ask to make searches and how to store/retrieve them
class Searches
  attr_reader :searches

  def initialize (search_api = GoogleApi)
    @searches = []
    @search_api = search_api
  end

  def new_search noun, colour
    @searches.unshift(search_api.search(noun, colour))
  end

  def self.instance
    @@instance
  end

  def latest_search
    return nil if searches.empty?
    searches.first.results
  end

  def previous_searches
    return nil if searches.length < 2
    searches[1..-1]
  end

  attr_reader :search_api
  @@instance = Searches.new
end
