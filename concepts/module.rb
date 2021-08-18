#module with self.included method
module Delicious
  
  def self.included(my_class) # runs when you call "include"
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

  def self.expire
    puts "Em"
  end

  expire
end

cake = Food.new
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

if cake.respond_to?("eat")
  puts "YES"
end
if !cake.respond_to?("cry")
  puts "no"
end

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
