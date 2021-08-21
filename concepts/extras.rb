var1=nil
var2=5

value = var1 || var2

value = var1 ? var1 : var2
p value

one = "one"
two = "one"
p one.eql?(two) # true
p one.equal?(two) #false



# The splat * operator
a = %w[a b]
def join(x, y)
  puts x + ' ' + y
end
join(*a) #a b
#join(a) #ArgumentError

#Symbol example
sym = :david
puts sym.upcase #DAVID
puts sym.succ #davie
puts sym[2] # "v"

#Keyword arguments
def m(a:, b:)
  puts a, b
end
m(a: 1, b: 2)
#m(3,5) # required keywords: a, b (ArgumentError)

#generate numbers with step 3 from 10 to 25
k = []
10.step(25, 3).each { |el| k << el }
puts k

def answer
  ans = gets.chomp.downcase
  case ans
  when "blue", "white"
    puts "blue or white"
  when "red"
    puts "red"
  else
    puts "else"
  end
end

answer
def gugu(n)
  a = n+2
  b = n+3
[a, b]
end

a, b = gugu(8)
p a
p b

p local_variables
p global_variables
