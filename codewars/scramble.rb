def scramble(s1, s2)
  s2.each_char do |char|
    return false unless s1.include? char

    s1.sub!(char, '')
  end
  true
end

def scramble(s1, s2)
  s2.chars.uniq.all?{|x| s2.count(x)<=s1.count(x)}
end

def scramble(s1, s2)
  s2.chars.all?{|x| s1.sub!(x, '')}
  # returns nil if no x in s1 => false
  # returns s1 if x is in s1 => true
end

p scramble("katam","steak")