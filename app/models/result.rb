#understands the results and stats of a single search
class Result
  attr_reader :response_time, :noun, :colour, :results

  def initialize (noun,colour,results,response_time)
    noun = noun
    colour = colour
    time_stamp = Time.now
    results = results
    response_time = response_time
  end

  def date
    time_stamp.strftime("%d/%m/%Y")
  end

  def time
    time_stamp.strftime("%H:%M:%S")
  end

  private
  attr_writer :noun, :colour, :time_stamp, :results, :response_time
end
