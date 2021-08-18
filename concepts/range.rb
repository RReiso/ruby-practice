r = Range.new(0,100) # inclusive
r = Range.new(0,100,true) # 100 excluded
r = 1..100 # inclusive
r = 1...100 #100 excluded
p r.begin
p r.end
p r.exclude_end? # true
p r.cover?(50) # true
p r.cover?(4.7) # true

#Range inclusion
r = 'a'..'z'
puts r.cover?('abc') #true
puts r.cover?('yzzzzzzz') #true
puts r.cover?('zab') #false
puts r.cover?('aBc') #true
n = 1.0..2.0
puts n.include?(1.567886) #true
puts n.include?(3.567886) #false