#understands the results and stats of a single search
class Response
  attr_reader :response_time, :noun, :colour, :results

  def initialize (noun,colour,results,response_time)
    @noun = noun
    @colour = colour
    @results = results
    @response_time = response_time
    @time_stamp = Time.now
  end

  def date
    time_stamp.strftime("%d/%m/%Y")
  end

  def time
    time_stamp.strftime("%H:%M:%S")
  end

  private
  attr_reader :time_stamp
end
