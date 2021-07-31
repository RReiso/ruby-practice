# Hashes and arrays

food = Hash.new([])
food[:vegetables] << 'tomatoes'
food[:fruits] << 'apples'
p food # {}
p food[:vegetables] # ["tomatoes", "apples"]
p food[:fruits] # ["tomatoes", "apples"]

food = Hash.new { |hash, key| hash[key] = [] }
food[:vegetables] << 'tomatoes'
food[:fruits] << 'apples'
p food # {:vegetables=>["tomatoes"], :fruits=>["apples"]}
p food[:vegetables] # ["tomatoes"]
p food[:fruits] # ["apples"]

hash1 = { fruit: 'apple', veggetable: 'tomato', number: 7 }

arr = hash1.sort_by { |key, value| key } #[[:fruit, "apple"], [:number, 7], [:veggetable, "tomato"]]
arr = hash1.sort_by { |key| key } #[[:fruit, "apple"], [:number, 7], [:veggetable, "tomato"]]
arr1 = hash1.sort_by(&:itself) #[[:fruit, "apple"], [:number, 7], [:veggetable, "tomato"]]
p arr1

arr.each { |key| p "key: #{key}" }
#"key: [:fruit, \"apple\"]"
# "key: [:number, 7]"
# "key: [:veggetable, \"tomato\"]"

arr.each { |key, value| p "key: #{value}" }
# "key: apple"
# "key: 7"
# "key: tomato"

arr.each { |key, value| p "key: #{key}, value: #{value}" }
# "key: apple"
# "key: 7"
# "key: tomato"

#Block
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

#Classes
class Dessert
end

class Icecream < Dessert
  @all_icecreams = {}
  @counter = 0

  def self.counter=(num)
    @counter = num
  end

  def self.counter
    @counter
  end

  def self.all
    @all_icecreams
  end

  def initialize
    self.class.counter += 1
    @number = self.class.counter
  end

  def flavour=(flavour)
    @flavour = flavour
    self.class.all[@number] = flavour
  end

  def flavour
    @flavour
  end
end

icecream1 = Icecream.new
p icecream1.flavour #nil
icecream1.flavour = 'strawberry'
p icecream1.flavour #strawberry

#Version1:
class Icecream
  def new_flavour=(flavour)
    self.flavour = flavour #call method flavour=
  end
end
icecream1.new_flavour = 'chocolate'
p icecream1.flavour #chocolate

# Version2:
class Icecream
  def new_flavour=(flavour)
    @flavour = flavour
    self.class.all[@number] = flavour #need to explicitly append to array
  end
end
icecream1.new_flavour = 'chocolate'
p icecream1.flavour #chocolate

p Icecream.all

icecream2 = Icecream.new
icecream2.flavour = 'vanilla'

p Icecream.all

icecream1.new_flavour = 'blueberry'

p Icecream.all # {1=>"blueberry", 2=>"vanilla"}

p icecream1.kind_of?(Dessert) #true
p icecream2.instance_of?(Dessert) #false

#Class expressions
res =
  class Result
    'string a'
    123
  end
p res #123

#validates method
class Book
  attr_accessor :title, :author, :year

  def self.validations
    @validations
  end

  def self.validates(attribute, rules)
    @validations ||= Hash.new
    @validations[attribute] = rules
  end

  validates :title, blank: false
  validates :year, type: :int, blank: false
end

p Book.validations # {:title=>{:blank=>false}, :year=>{:type=>:int, :blank=>false}}

names_with_ages = [['lucy', 3], ['rita', 9], ['markus', 11]]

names_with_ages.each { |name, age| puts name.ljust(7, '*') + age.to_s }
# lucy***3
# rita***9
# markus*11

p '1 esmu26 5'.gsub(/\d+/) { |num| num.next } #"2 esmu27 6"
p '1 esmu26 5'.gsub(/\d+/, &:next) #"2 esmu27 6"

class ArtStyle
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  attr_writer :name
end

my_style = ArtStyle.new('Cubism')
p my_style.name # Cubism
# my_style.name = "Impressionism" #NoMethodError

my_style.__send__(:name=, 'Impressionism')
p my_style.name # Impressionism

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

#module with self.included method
module Delicious
  
  def self.included(my_class)
     attr_accessor :food
  end

  def eat
    @food ||= 0
    @food += 1
    puts "I have eaten #{food} items of food."
  end
end

class Food
  include Delicious

  def self.kaka
    puts "Em"
  end

  kaka
end

cake = Food.new
cake.eat
cake.eat
p cake.food
p Food.methods(false).sort
p cake.method(:eat).super_method

if cake.respond_to?("eat")
  puts "YES"
end
if !cake.respond_to?("cry")
  puts "no"
end

#proc
def call_proc(my_proc)
count = 500
my_proc.call
end

count = 1
my_proc = Proc.new { puts count }
call_proc(my_proc) # 1

up = Proc.new { |word| word.upcase }
 p %w(a b caca).map(&up)



 array = %w[a  b  c  d  1  2  b  c  d  e]

 array.pop # removes last elemnt
 array.shift # removes first element
 array.delete_if {|el| el.match(/\d/)} # removes every element for which the block evaluates as true

 array.delete_at(1) # removes element at index 1
 array.delete_at(array.index("d")) # removes first occurance of "d"
 array.delete("b") # removes all occurances of "b"
 p array # [c, d]

var1=nil
var2=5

value = var1 || var2

value = var1 ? var1 : var2
p value

one = "one"
two = "one"
p one.eql?(two) # true
p one.equal?(two) #false

a = %Q[a b c]
p a

def missing_number(nums)
    count = 0
    nums.sort!.each do |num| 
        if count != num
            return count
        end
        count+=1
    end
    count
end

p missing_number([0,1])