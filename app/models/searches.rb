class Searches
  attr_reader :searches

  def initialize
    @searches = []
  end

  def new_search colour, noun
    result,response_time = GoogleApi.search("#{colour} #{noun}")
    @searches << Result.new(colour, noun, result, response_time)
  end
  def self.instance
    @@instance
  end

  def latest_search
    searches.last.results
  end

  def previous_searches
    return nil if searches.length < 2
    searches[0..-2]
  end

  @@instance = Searches.new
end
