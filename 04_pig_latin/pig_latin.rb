def consonants
  consonants = ('a'..'z').to_a - %W(a e i o u)

  # Add phonemes to consonants array
  consonants << 'qu'

  # make sure to count 'qu' as a consonant even if it's preceeded by a consonant
  temp = Array.new(consonants.size)
  temp.each_index { |i| temp[i] = consonants[i] + "qu" }

  consonants = consonants + temp
end

def translate(string)
  if string.include?(' ')
    words = string.split(' ')

    words.each_with_index do |word, i|
      words[i] = translate_word(word)
    end

    words.join(' ')
  else
    translate_word(string)
  end
end

def translate_word(word)
  if begins_with_vowel?(word)
    word << "ay"
  elsif begins_with_three_consonants?(word)
    word[3..-1] << word[0..2] << "ay"
  elsif begins_with_two_consonants?(word)
    word[2..-1] << word[0..1] << "ay"
  elsif begins_with_consonant?(word)
    word[1..-1] << word[0] << "ay"
  end
end

def begins_with_vowel?(word)
  %W(a e i o u).include?(word[0])
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
