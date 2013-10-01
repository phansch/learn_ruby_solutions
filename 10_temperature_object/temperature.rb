class Temperature
  attr_accessor :f, :c
  def initialize(opts = nil)
    opts = {
      f: nil,
      c: nil,
    }.merge(opts || {})

    @f = opts[:f]
    @c = opts[:c]
  end

  def in_fahrenheit
    if @c
      @c * 9.0/5.0 + 32.0
    else
      @f
    end
  end

  def in_celsius
    if @f
      (@f - 32.0) * 5.0/9.0
    else
      @c
    end
  end

  def self.from_celsius(celsius)
    Temperature.new(:c => celsius)
  end

  def self.from_fahrenheit(fahrenheit)
    Temperature.new(:f => fahrenheit)
  end
end