#Instance variables and class instance variables
class MusicalInstrument
  def self.family
    @family # self: MusicalInstrument class
  end

  def self.set_family
    @family = 'wind instruments'
  end

  def family
    @family # self: instance of MusicalInstrument class
  end

  def set_family
    @family = 'flutes'
  end
end

MusicalInstrument.set_family
new_instrument = MusicalInstrument.new
new_instrument.set_family

p new_instrument.family # flutes
p MusicalInstrument.family # wind instruments

# Defining your '===' method for case statements
class Course
  include Comparable
  attr_accessor :professor, :nr_of_lectures
  def initialize(professor, nr_of_lectures)
    self.professor = professor
    #  @professor
    self.nr_of_lectures = nr_of_lectures
  end

  def ===(other_course)
    self.professor == other_course.professor
    #  @professor
    #  professor
  end

  def <=>(other_course)
    self.nr_of_lectures <=> other_course.nr_of_lectures
    # nr_of_lectures <=> other_course.nr_of_lectures
  end
end
art = Course.new('McArthur', 123)
math = Course.new('Green', 80)
sociology = Course.new('McArthur', 102)

case art
when math
  puts 'Same professor as math!'
when sociology
  puts 'Same professor as sociology!'
else
  puts 'Diffirenet professors'
end

p art > math # true
p art <=> math # 1

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


class Painting
  @@styles = []
  @@paintings = {}
  @@total_count = 0
  self.attr_reader :style

  def self.all_paintings
    @@paintings
  end
  def self.total_count
    @@total_count
  end
  def self.add_style_to_library(style)
    if !@@styles.include?(style)
      @@styles << style
      @@paintings[style] = 0
    end
  end

  def initialize(style)
    if @@styles.include?(style)
      puts "Drawing a new painting in #{style} style!"
      @style = style
      @@paintings[style] += 1
      @@total_count += 1
    else
      raise "No such style in the library: #{style}."
    end
  end
  def same_style_count
    @@paintings[self.style]
  end
end
Painting.add_style_to_library('Impressionism')
Painting.add_style_to_library('Cubism')
paint1 = Painting.new('Impressionism')
paint2 = Painting.new('Cubism')
paint3 = Painting.new('Impressionism')
puts "There are #{paint1.same_style_count} paintings in #{paint1.style} style."
puts "There are #{Painting.total_count} paintings total."
puts Painting.all_paintings
# Drawing a new painting in Impressionism style!
# Drawing a new painting in Cubism style!
# Drawing a new painting in Impressionism style!
# There are 2 paintings in Impressionism style.
# There are 3 paintings total.
# {"Impressionism"=>2, "Cubism"=>1}

# @variable and self.method in class definition
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def greet
    puts "Hello #{@name}"
    puts "Hello #{self.name}" #Calling method name on self (def name @name end) - from attr_acc.
    puts "Hello #{name}" #Calling a name methof that returns @name
  end
end

p1 = Person.new('John')
p1.greet


class Cow
  @count = 10
  puts 'hello' #get's executed when program runs
  def self.count
    @count
  end
end
class BigCow < Cow
end
p Cow.count # 10
p BigCow.count #nil

class BigCow
  @count = 200
end
p BigCow.count #200
a = Cow.new 

#class instance variable
#puts statement "hello" from Cow class doesnt get executed