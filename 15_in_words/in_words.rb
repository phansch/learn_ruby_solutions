module Inwords
  def in_words
    self.to_word
  end

  #where the magic happens
  def to_word
    return "zero" if self.zero?

    string = ""
    number = self

    orders = [
      [100, "hundred"],
      [1000, "thousand"],
      [1_000_000, "million"],
      [1_000_000_000, "billion"],
      [1_000_000_000_000, "trillion"],
    ]

    orders.reverse.each do |limit, name|
      if number > limit - 1
        quotient, rest = number.divmod(limit)
        if quotient > 0
          string << "#{quotient.to_word} #{name}"
          number = rest
          if number > 0
            string << " "
          end
        end
      end
    end

    ones = %W(one two three four five six seven eight nine)
    teens = %W(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %W(ten twenty thirty forty fifty sixty seventy eighty ninety)

    if number < 10 && number > 0
      string += ones[number-1]
    elsif number < 20 && number > 0
      string += teens[number-10]
    elsif number < 100 && number > 0
      quotient, rest = number.divmod(10)
      string_tens = ""
      ten_part = quotient * 10
      string_tens += ones[rest-1] if rest != 0
      string_tens.prepend(tens[ten_part/10 - 1] + " ")
      string_tens.strip! if rest == 0
      string += string_tens
    end

    string
  end
end

class Fixnum
  include Inwords
end

class Bignum
  include Inwords
end

