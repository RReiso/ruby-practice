def rgb(r, g, b)
  nums = [r, g, b]
  hex =
    nums.map do |num|
      num = 255 if num > 255
      num = 0 if num < 0

      num.between?(0, 15) ? "0#{num.to_s(16).upcase}" : num.to_s(16).upcase
    end
  hex.join('')
end

p rgb(0, 14, 120)
