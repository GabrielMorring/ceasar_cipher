require 'pry-byebug'

puts "Enter a message to encode"
message = gets.chomp

puts "Enter the shift amount for your message (Integers only)"
shift = gets.chomp.to_i

# 65-90 are the ASCII codes for A-Z
def shift_upper(num, shift)
  return (((num + shift) % 90) + 64).chr if (num + shift) > 90
  (num + shift).chr
end

# 97-122 are the ASCII codes for a-z
def shift_lower(num, shift)
  return (((num + shift) % 122) + 96).chr if (num + shift) > 122
  (num + shift).chr
end

def ceasar_cipher(message, shift)
  shifted = []
  message.each_char do |char|
    num = char.ord
    if num.between?(65, 90)
      shifted.push(shift_upper(num, shift))
    elsif num.between?(97, 122)
      shifted.push(shift_lower(num, shift))
    else
      shifted.push(char)
    end
  end
  shifted.join("")
  
end

puts ceasar_cipher(message, shift)