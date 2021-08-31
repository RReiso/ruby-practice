def all_squared_pairs(num)
  result = []
  i = 0
  k = 0
  loop do
    first=i**2
    loop do
      sum = first + k**2 
      if (sum == num)
        result << [i, k]
      elsif (sum > num)
        break
      end
      k += 1
    end
    i += 1
    k = i
    break if i**2 + k**2 > num
  end
  result
end

p all_squared_pairs(29641625)

