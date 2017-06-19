def search
  attr_reader: response_time, noun, colour, results

  def Initialize (noun,colour,results)
    @noun = noun
    @colour = colour
    @time = Time.now
    @results = results
  end

  def date
    time.strftime("%d/%m/%Y")
  end

  def time
    time.strftime("%H:%M:%S")
  end
end
