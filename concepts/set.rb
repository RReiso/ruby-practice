require "set"
arr = %w[a b c a b d e]
s = Set.new(arr)
p s # #<Set: {"a", "b", "c", "d", "e"}>
s = Set.new(arr){|letter| letter + "X"}
p s # #<Set: {"aX", "bX", "cX", "dX", "eX"}>

s.add("f")
s.delete("f")
p s.add?("aX") # nil
p s.add?("f") # #<Set: {"aX", "bX", "cX", "dX", "eX", "f"}>

#a+b, a-b, a&b, a^b, subset?, superset?

s = Set.new(%w[a b c d])
s.add({a:1,b:2})
p s # #<Set: {"a", "b", "c", "d", {:a=>1, :b=>2}}>
s.merge({a:1,b:2})
p s # #<Set: {"a", "b", "c", "d", {:a=>1, :b=>2}, [:a, 1], [:b, 2]}>
s.merge(({a:1,b:2}).keys)
p s # #<Set: {"a", "b", "c", "d", {:a=>1, :b=>2}, [:a, 1], [:b, 2], :a, :b}>

require 'set'
a = Set.new(%w[B C])
puts a.object_id
a.add('E')
puts a # Set: {"B", "C", "E"}>
puts a.object_id
a.add({ 'A' => 'a', 'B' => 'b' })
puts a # <Set: {"B", "C", "E", {"A"=>"a", "B"=>"b"}}>
a.merge({ 'C' => 'c', 'D' => 'd' })
puts a # <Set: {"B", "C", "E", {"A"=>"a", "B"=>"b"}, ["C", "c"], ["D", "d"]}>
puts a.object_id
b = Set.new({ 'C' => 'c', 'D' => 'd' })
puts b # <Set: {["C", "c"], ["D", "d"]}>

#generate numbers with step 3 from 10 to 25
k = []
10.step(25, 3).each { |el| k << el }
puts k