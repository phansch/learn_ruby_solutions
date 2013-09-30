class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    minutes, seconds = @seconds.divmod(60)
    hours, minutes = minutes.divmod(60)

    s = sprintf("%#02d", seconds)
    m = sprintf("%#02d", minutes)
    h = sprintf("%#02d", hours)

    "#{h}:#{m}:#{s}"
  end
end