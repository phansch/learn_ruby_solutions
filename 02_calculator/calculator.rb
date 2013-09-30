def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  sum = 0
  arr.each { |e| sum += e }
  sum
end

def multiply(a, b, *c)
  output = 0
  output = a * b
  c.each { |e| output *= e }
  output
end

def power(a, b)
  a**b
end

def factorial(n)
  return 1 if n == 0 or n == 1
  fac = 1
  loop do
    break if n == 1
    fac = fac * n
    n -= 1
  end
  fac
end