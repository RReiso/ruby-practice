def persistence(n, times = 0)
  return times if n>=0 && n<10

  times+=1
  nums = []
  while n>0
    n, remainder = n.divmod(10)
    nums << remainder
  end
  persistence(nums.reduce(:*), times)
end

p persistence(694)

def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end