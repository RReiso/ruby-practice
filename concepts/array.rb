p Array.new(3) # [nil, nil, nil]
p Array.new(3,4) # [4, 4, 4]
p Array.new(3, "ab") # ["ab", "ab", "ab"] Refer to the same string
p Array.new(3){"ab"} # ["ab", "ab", "ab"] Three different strings

p %i[a b c] # [:a, :b, :c]

a = [1,2,3,4,5,2]
p a.take(3) # [1, 2, 3]
p a.detect {|el| el % 2 == 0 } # returns first el that satisfies the statement
p a.one? {|el| el % 2 == 0 } # false (because there is more than one that satisfy he statement)
# all?, any?, none?

a[1,2] = "x1", "y1", "x2"
p a # [1, "x1", "y1", "x2", 4, 5, 2]
p a.grep(/x/) # ["x1", "x2"] # returns el with "x" in them
p a.grep(1..4) # [1, 4, 2]
p a.grep(1..4) {|nr| nr * 100}# [100, 400, 200]

p a.values_at(0,3) # [1, "x2"]
p a.slice(1,3) # ["x1", "y1", "x2"] - new array
a.replace(['a', 7])
p a # ["a", 7]

a = [1,2,[3,4,[5]]]
p a.flatten! # [1, 2, 3, 4, 5]
p a.join("--") # "1--2--3--4--5"

p [1,5,3,9,2,1,5,5].tally # {1=>2, 5=>3, 3=>1, 9=>1, 2=>1}
p %w[ama ba kara di ku kam].tally # {"ama"=>1, "ba"=>1, "kara"=>1, "di"=>1, "ku"=>1, "kam"=>1}
p %w[ama ba kara di ku kam].group_by { |el| el.length} # {3=>["ama", "kam"], 2=>["ba", "di", "ku"], 4=>["kara"]}
p %w[ama ba kara di ku kam].group_by(&:length) # {3=>["ama", "kam"], 2=>["ba", "di", "ku"], 4=>["kara"]}
p %w[ama ba kara di ku kam].sort_by(&:length) # ["ba", "di", "ku", "ama", "kam", "kara"]

p [1,3,4,5,8,9,4,3,4].take_while {|n| n<8} # [1, 3, 4, 5]
p [1,3,4,5,8,9,4,3,4].drop_while {|n| n<8} # [8, 9, 4, 3, 4]
p [1,3,4,5,8,9,4,3,4].partition{|n| n<8} # [[1, 3, 4, 5, 4, 3, 4], [8, 9]]

#size, empty?, include?, count, first, last, sample, reverse

p 5.step(16,2).map {|num| num.to_s + "!"} # ["5!", "7!", "9!", "11!", "13!", "15!"]