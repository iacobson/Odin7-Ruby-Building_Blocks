

def substring(input_string, dictionary)

  result = {}
  # eliminate punctuation from input string, convert to downcase and put it as array
  input_string.downcase.gsub(/[^[:word:]\s]/, '').split(" ").each do |input_word|

    dictionary.each do |dictionary_word|

      if input_word.include? dictionary_word
        if result[dictionary_word] == nil
          result[dictionary_word] = 1
        else
          result[dictionary_word] += 1
        end
      end
    end
  end
  puts result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substring("Howdy partner, sit down! How's it going?", dictionary)
