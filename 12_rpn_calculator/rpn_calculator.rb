class RPNCalculator
  attr_reader :value

  def initialize
    @stack = []
  end

  def push(number)
    @stack.push(number)
  end

  def plus
    calc("+")
  end

  def minus
    calc("-")
  end

  def divide
    calc("/")
  end

  def times
    calc("*")
  end

  def calc(op)
    raise "calculator is empty" if @stack.empty?

    num_a, num_b = @stack.pop(2)
    num_a, num_b = num_b, num_a if op == "+"

    @value = num_a.to_f.send(op, num_b.to_f) # Object.send
    push(@value)
  end

  def tokens(string)
    tokens = string.split(' ')
    tokens.each_index do |i|
      if %W(+ - * /).include?(tokens[i])
        tokens[i] = tokens[i].to_sym
      end
      tokens[i] = Integer(tokens[i]) unless %i(+ - * /).include?(tokens[i])

    end
  end
end