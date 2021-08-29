lam = lambda {11}
p [1,2,3,4].find(lam) {|nr| nr > 10} # 11; if "find" fails, lambda is called

def greet
  ran_nr = rand(100)
  yield ran_nr
end

greet { |nr| puts "Hello #{nr}" }

greet { |nr| puts "Welcome #{nr}!" }

def greet2(&my_block)
  ran_nr = rand(100)
  my_block.call(ran_nr)
end

greet2 { |nr| puts "Hello #{nr} with call method!" }

def greet3
  puts 'Check'
  ran_nr = rand(100)
  yield self, ran_nr if block_given?
end

greet3 { |obj, nr| puts "Hello #{obj} and #{nr} with 'if block_given'" }

greet3

# Proc and lambda
proc1 = Proc.new { |x| x + 100 }
p [1, 2, 3].map(&proc1)

def some_method(&proc)
  [8, 9, 10].map { |el| yield el }
end

p some_method(&proc1) # [108, 109, 110]

def some_method1(proc)
  [8, 9, 10].map { |el| proc.call(el) }
end

p some_method1(proc1) # [108, 109, 110]

def some_method2(&proc)
  [8, 9, 10].map { |el| proc.call(el) }
end

p some_method2(&proc1) # [108, 109, 110]

lambda1 = lambda { |x| x * 100 }

def some_method3(&my_lam)
  my_lam.call(5)
end
p some_method3(&lambda1)

def some_method4(my_lam)
  my_lam.call(5)
end
p some_method4(lambda1)

p [10, 11, 12].map(&lambda1)

def call_proc(my_proc)
count = 500
my_proc.call
end

count = 1
my_proc = Proc.new { puts count }
call_proc(my_proc) # 1

up = Proc.new { |word| word.upcase }
 p %w(a b caca).map(&up)

 #Lambda and proc example
def lambda_vs_proc
  my_lam = lambda { return puts "Hi, I'm your lambda!" }
  my_lam.call
  puts 'Returned from lambda!'
  my_proc = Proc.new { return puts 'Hello from proc!' }
  my_proc.call
  puts 'The proc will not allow this to be seen!'
end
lambda_vs_proc
# Hi, I'm your lambda!
# Returned from lambda!
# Hello from proc!


# currying
add = ->(a,b){a+b}
add2=->(a){->(b){a+b}}
p add2.call(5).call(6) # 11
p add2.curry.(5).(6)


select_multiples = ->(num,arr) { arr.select{|el| el % num == 0}}
p select_multiples.curry.(3).([5,6,8,9,10,12]) # [6,9,12]

printing = method(:puts)
[1,2,3,4].each(&printing)