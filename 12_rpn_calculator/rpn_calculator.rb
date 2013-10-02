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

  # Tokenizes a string
  def tokens(string)
    tokens = string.split(' ')
    tokens.each_index do |i|
      tokens[i] = tokens[i].to_sym if %W(+ - * /).include?(tokens[i])
      tokens[i] = Integer(tokens[i]) unless %i(+ - * /).include?(tokens[i])
    end
  end

  # Evaluates a string in postfix notation and returns the result
  def evaluate(postfix)
    tokens = tokens(postfix)
    tokens.each do |token|
      if token.is_a?(Fixnum)
        push(token)
      elsif %i(+ - * /).include?(token)
        calc(token.id2name)
      end
    end
    @value
  end

  private

  # Calculation method. Uses Object.send to do math operations
  def calc(op)
    raise "calculator is empty" if @stack.empty?

    num_a, num_b = @stack.pop(2)
    @value = num_a.to_f.send(op, num_b.to_f) # Object.send
    push(@value)
  end
end