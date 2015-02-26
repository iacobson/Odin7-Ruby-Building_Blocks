@alphabet = {}
i = 1
# map letters to numbers into a new Hash
("a" .. "z").each do |letter|
  @alphabet[letter] = i
  i += 1
end


def caesar_cipher(input_string, shift_factor)
  # convert string to array in order to use "each" method
  # **"each.with_index"** to get the index for each iterration
  input_string.split("").each.with_index do |letter, index|
    if ("a" .. "z").include? letter.downcase
      # finds the letter id in the alphabet hash
      initial_letter_id = @alphabet[letter.downcase]
      # if scenario to restart the alphabet after letter nr 26
      if initial_letter_id + shift_factor <= 26
        final_letter_id = initial_letter_id + shift_factor
      else
        final_letter_id = initial_letter_id + shift_factor - 26
      end
      # if the letter was initially uppercase
      if letter =~ /[[:upper:]]/
        # **"hash.invert"** is INVERTING the keys with the values, so you can search by initial values
        input_string[index] = @alphabet.invert[final_letter_id].upcase
      else
        input_string[index] = @alphabet.invert[final_letter_id]
      end
    end
  end
  puts input_string
end

#solution

print "Enter the string to be converted:"
input_string = gets.chomp
print "Enter Shift Factor (key):"
shift_factor = gets.chomp
caesar_cipher(input_string, shift_factor.to_i).to_s
