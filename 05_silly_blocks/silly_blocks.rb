# Not sure if any of this is the right way to do it

def reverser
  # each time the block is called, this is executed
  test = yield

  arr = test.split(' ')
  arr.each_index { |i| arr[i] = arr[i].reverse }
  arr.join(' ')
end

def adder(add = 1)
  yield + add
end

def repeater(repeat = 1)
  repeat.times { yield }
end