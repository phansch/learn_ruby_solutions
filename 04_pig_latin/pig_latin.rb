def consonants
  consonants = ('a'..'z').to_a + ('A'..'Z').to_a - vowels
  # Add extra phonemes to consonants array
  consonants << 'qu'
  consonants << 'sch'

  # Make sure to count 'qu' as a consonant even if it's preceeded by a consonant
  temp = Array.new(consonants.size)
  temp.each_index { |i| temp[i] = consonants[i] + "qu" }

  consonants = consonants + temp
end

def vowels
  %W(a e i o u A E I O U)
end

def translate(string)
  if string.include?(' ')
    words = string.split(' ')
    words.each_index { |i| words[i] = translate_word(words[i]) }.join(' ')
  else
    translate_word(string)
  end
end

def translate_word(word)
  # Remember capitalized words for later and downcase everything
  capitalize = true if is_capitalized?(word)
  word.downcase!

  # Actual translation
  if begins_with_vowel?(word)
    word << "ay"
  elsif begins_with_three_consonants?(word)
    word = word[3..-1] << word[0..2] << "ay"
  elsif begins_with_two_consonants?(word)
    word = word[2..-1] << word[0..1] << "ay"
  elsif begins_with_consonant?(word)
    word = word[1..-1] << word[0] << "ay"
  end

  word[0] = word[0].upcase! if capitalize
  word
end

def is_capitalized?(word)
  ('A'..'Z').to_a.include?(word[0])
end

def begins_with_vowel?(word)
  vowels.include?(word[0])
end

def begins_with_consonant?(word)
  consonants.include?(word[0])
end

def begins_with_two_consonants?(word)
  consonants.include?(word[0]) &&
  consonants.include?(word[1]) ||
  consonants.include?(word[0..1])
end

def begins_with_three_consonants?(word)
  consonants.include?(word[0]) &&
  consonants.include?(word[1]) &&
  consonants.include?(word[2]) ||
  consonants.include?(word[0..2])
end