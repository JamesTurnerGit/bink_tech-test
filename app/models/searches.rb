#understands who to ask to make searches and how to store/retrieve them
class Searches
  attr_reader :searches

  def initialize
    @searches = []
  end

  def new_search colour, noun
    result,response_time = GoogleApi.search("#{colour} #{noun}")
    @searches << Response.new(colour, noun, result, response_time)
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

  @@instance = Searches.new
end
