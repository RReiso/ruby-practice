def caesar_cipher(string, shift_factor)
  result = ""
  string.each_char do |char|
    # use cipher only if char is an uppercase or lowercase letter
    if char.ord.between?(65,90) || char.ord.between?(97,122)
      new_code = char.ord + shift_factor
      #ensure wrapping from Z to A or z to a
      if (new_code > 91 && char.ord < 91) || new_code > 122
        new_code-= 26
      end
      result+=new_code.chr
    else
      result+=char
    end    
  end
result
end


puts (caesar_cipher("What a string", 5))