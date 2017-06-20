class Result
  attr_reader :response_time, :noun, :colour, :results

  def initialize (noun,colour,results,response_time)
    @noun = noun
    @colour = colour
    @time = Time.now
    @results = results
    @response_time = response_time
  end

  def date
    @time.strftime("%d/%m/%Y")
  end

  def time
    @time.strftime("%H:%M:%S")
  end
end
