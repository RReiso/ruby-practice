#module with self.included method
module Delicious
  
  def self.included(my_class) # runs when you call "include" (class methods)
     attr_accessor :food

     def my_class.taste
      puts "tasty!"
     end
  end

  def eat # instance method to be included in the class
    @food ||= 0
    @food += 1
    puts "I have eaten #{food} items of food."
  end
end

class Food
  include Delicious

  def self.expire
    puts "Em"
  end

  expire # runs when class is defined!
end

cake = Food.new
Food.taste
Food.expire
cake.eat
eat_method = cake.method(:eat)
eat_method.call
method = Food.instance_method(:eat)
# method.call #NoMethodError
cake.eat
p cake.food
p Food.methods(false).sort
p cake.method(:eat).super_method
p cake.instance_variables # [:@food]

if cake.respond_to?("eat")
  puts "YES"
end
if !cake.respond_to?("cry")
  puts "no"
end

# Module with self.extended method
module Happy
  def self.extended(obj) # Runs as soon as object extend this module. (Class methods or if objextend(Happy) - then methods for this particular object. Class is also an object. Can do: with "extend" inside the class or myClass.extend(Happy) )

    puts "I run"
    def obj.smile
      puts "object #{obj} is smiling!"
    end
  end

  def laugh # Method for the class
    puts "Laughing!"
  end
end

class Human
  extend Happy # I run
end

p Human.methods.sort
p Human.laugh


# Run code when superclass inherits a subclass
class Grandpa
  def self.inherited(subclass)
    puts "NOW"
    def subclass.new_method
      puts "new_method"
    end
  end
end

class Papa < Grandpa # NOW
end
class Child < Grandpa # NOW
end
p Child.new_method # new method

#Nested classes and modules. Scope (1.5)
class C
  a = 5
  module M
    a = 4
    module N
      a = 3
      class D
        a = 2
        def show_a
          a = 1
          puts a
        end
        puts a
      end
      puts a
    end
    puts a
  end
  puts a
end
d = C::M::N::D.new
d.show_a

#Output: 23451

#Accessibility of constants:
module M
  class C
    X = 2
    class D
      module N
        X = 1
      end
    end
  end
end
puts M::C::D::N::X
puts M::C::X
#Output: 1,2


module Masr
  def self.extended(base) # runs when you call "extend". Methods are executed in the context of the class the module is included
    def base.acce 
      puts 'hello'
    end
  end
  def a_method
    puts 'This module supplies this method.'
  end
end

class Bus
  # extend Masr
end
Bus.extend(Masr)
Bus.acce
Bus.a_method
