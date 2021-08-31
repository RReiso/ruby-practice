def all_squared_pairs(num)
  result = []
  i = 0
  k = 0
  loop do
    loop do
      if (i**2 + k**2 == num)
        result << [i, k].sort
      elsif (i**2 + k**2 > num)
        k = 0
        break
      end
      k += 1
    end
    i += 1
    break if i**2 + k**2 > num
  end
  result.uniq
end

p all_squared_pairs(325)
