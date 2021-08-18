input = 3

case input
in String then puts 'input was of type String'
in Integer then puts 'input was of type Integer'
end

arr = [1, 2]

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, 9, 10]
  puts :match
end

arr = [1, 2, 3, 4]

case arr
in [1, 2, *tail]
  p tail
end

arr = [1, 2, 3, 4, 5]

case arr
in [1, 2, 3, a, b]
  puts a
  puts b
end

case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a
  puts b
end
#same:
case { a: 'apple', b: 'banana' }
in a:, b:
  puts a
  puts b
end

case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end