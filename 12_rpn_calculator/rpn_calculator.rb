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
    nums = @stack.pop(2)

    index_a, index_b = 0, 1
    index_a, index_b = index_b, index_a if op == "+"

    @value = nums[index_a].to_f.send(op, nums[index_b].to_f) # Object.send
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