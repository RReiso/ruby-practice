# Create a function that takes a positive integer and 
# returns the next bigger number that can be formed by 
# rearranging its digits. For example:

# 12 ==> 21
# 513 ==> 531
# 563 ==> 635    653    635
# 2017 ==> 2071
# 2871 ==> 7128  
# 

def next_number(int)
  arr = []
  copy_int = int
  while copy_int > 0
    copy_int, num = copy_int.divmod(10)
    p copy_int, num
    arr.unshift(num)
  end

  permutations = arr.permutation.to_a
  numbers=[]
  permutations.each do |array|
    numbers << array.inject{|n, d| n * 10 + d}
  end
  numbers  = numbers.sort
  numbers.each_with_index do |number, i|
    return numbers[i+1] if number == int
  end
  return -1
end
p(next_number(563))

def next_number2(int)
  permutations = int.to_s.split("").permutation.to_a
  all_numbers = []
  permutations.each do |array|
    all_numbers << array.join().to_i
  end
  all_numbers = all_numbers.sort.uniq
  all_numbers.each_with_index do |number,i|
    if number == int
      return all_numbers[i+1] || -1
    end
  end
end
p(next_number2(314472))


def next_bigger(n)
  chars = n.to_s.chars
  (0..chars.length-2).reverse_each do |i|
    (i+1..chars.length-1).reverse_each do |j|
      if chars[i] < chars[j]
        chars[i], chars[j] = chars[j], chars[i]
        return (chars.first(i + 1) + chars.last(chars.length - 1 - i).sort).join.to_i
      end
    end
  end
  -1
end

p(next_bigger(314472))
