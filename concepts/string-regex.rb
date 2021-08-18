# gsub
p '1 esmu26 5'.sub(/\d+/) { |num| num.next } #"2 esmu26 5" First occurance
p '1 esmu26 5'.gsub(/\d+/) { |num| num.next } #"2 esmu27 6"
p '1 esmu26 5'.gsub(/\d+/, &:next) #"2 esmu27 6"

# regex
p /abcde/.match("hello abcd") # nil
p /abc/.match("hello abcd") #<MatchData "abc">
p /abc/.match?("hello abcd") # true
p "hello abcd".match?(/abc/) # true
p /abc/=~ "hello abcd" # 6

# Escape characters
p /\/home\/ruta/.match?("C:/home/ruta") #true
p %r[/home/ruta].match?("C:/home/ruta") #true

p /.ine/.match?("dine") # true
p /[md]ine/.match?("dine") # true
p /[md]ine/.match?("mine") # true
p /[f-p]ine/.match?("mine") # true
p /[a-e]ine/.match?("mine") # false

# numbers
p /\d/.match?("d7u66") # true
p /[0-9]/.match?("d7u66") # true

# \d+ - 1 or more digits
# \w - any digit, letter or underscore
# \s - whitespace
# \D - any char that is not a digit
# \W - any char that is not a digit, letter or underscore
# \S - any char that is not a whitespace
# ? - 0 or 1
# * - 0 or more
# + - 1 or more
# {3} - exactly 3 chars
# {1,10} - 1 to 10 chars
# {3, } - 3 or more chars
# ^ - beginning of a line
# i - case insensitive

string = 'My phone number is (123) 555-1234.'
phone_regex = /\((\d{3})\)\s+(\d{3})-(\d{4})/
m = phone_regex.match(string)
3.times { |index| puts "Capture ##{index + 1}: #{m.captures[index]}" }

p "Mani sauc Arturs".scan(/[aeiou]/i) # ["a", "i", "a", "u", "A", "u"]

