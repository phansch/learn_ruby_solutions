class RPNCalculator
  attr_reader :value

  def initialize
    @stack = []
  end

  def push(number)
    @stack.push(number)
  end

  # Add the last two numbers on the stack
  def plus
    raise "calculator is empty" if @stack.empty?
    @value = @stack.pop + @stack.pop
    @stack.push(@value)
  end

  def minus
    raise "calculator is empty" if @stack.empty?
    minuends = @stack.pop(2)
    @value = minuends[0] - minuends[1]
    @stack.push(@value)
  end

  def divide
    raise "calculator is empty" if @stack.empty?
    dividends = @stack.pop(2)
    @value = dividends[0].to_f / dividends[1].to_f
    @stack.push(@value)
  end

  def times
    raise "calculator is empty" if @stack.empty?
    factors = @stack.pop(2)
    @value = factors[0].to_f * factors[1].to_f
    @stack.push(@value)
  end
end