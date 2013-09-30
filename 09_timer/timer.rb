class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    seconds, minutes, hours = 0, 0, 0

    if @seconds > 3600
      hours = @seconds / 3600
      minutes = @seconds / 600
    end
    if @seconds > 600 && @seconds < 3600
      minutes = @seconds / 600
    end
    if @seconds > 60 && @seconds < 600
      minutes = @seconds / 60
    end

    seconds = @seconds % 60

    sec = sprintf("%#02d", seconds)
    min = sprintf("%#02d", minutes)
    hour = sprintf("%#02d", hours)
    "#{hour}:#{min}:#{sec}"
  end
end