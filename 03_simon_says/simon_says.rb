def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, repeats = 2)
  ((string + " ") * repeats).strip
end

def start_of_word(word, count)
  word[0,count]
end

def first_word(string)
  string.split(' ')[0]
end

def titleize(string)
  littlewords = [ "and", "over", "the" ]
  string[0] = string[0].upcase

  if string.include?(' ')
    words = string.split(' ')
    words.each_index do |i|
      words[i][0] = words[i][0].upcase unless littlewords.include?(words[i])
    end
    string = words.join(' ')
  end
  string
end