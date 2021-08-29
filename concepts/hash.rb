h = Hash[[[1,2],[3,4],[5,6],[6,7]]]
p h # {1=>2, 3=>4, 5=>6, 6=>7}
h = Hash([]) # empty hash

h = {a: 1, b: 2, c:3}
p h["d"] # nil
# h.fetch["d"] # ArgumentError
# h.fetch("d") # KeyError
p h.fetch("d", 4) # 4
p h.fetch(:a, 7) # 1
p h.values_at(:a,:d) # [1,nil]
# h.fetch_values(:a,:d) #KeyError

# .dig - for nested arrays

h = Hash.new(0)
p h[:a] # 0
p h # {}

h = Hash.new{|hash,key| hash[key] = 0}
p h[:a] # 0
p h # {:a=>0}

p h.update({a: 1, b:2}) # {:a=>1, :b=>2}
p h.replace({c:3}) # {:c=>3}

p h.has_key?(:c) #true
p h.include?(:c)
p h.key?(:c) # true
p h.member?(:c)
p h.has_value?(3) # true
p h.value?(3)
p h.empty? # false
p h.size # 1
p h.fetch(:c) # 3
# p h.fetch(:m) # KeyError
p h.fetch(:m, 6) # 6
p h.fetch(:m) {6} # 6
p h # {:c=>3}
a = {m:5}
p a.merge!(h) # {:m=>5, :c=>3}

# select, reject - with block
# compact - eliminates keys with value nil
# clear - empties the hash
# dig - for nested hashes

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
# arr = hash1.sort_by(&:last) # Error
arr = hash1.sort_by { |key| key } #[[:fruit, "apple"], [:number, 7], [:veggetable, "tomato"]]
arr1 = hash1.sort_by(&:itself) #[[:fruit, "apple"], [:number, 7], [:veggetable, "tomato"]]
p arr1
p arr1.to_h # back to hash

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

#Find word length with reduce method
def find_word_lengths(word_list)
  word_list.reduce(Hash.new(0)) do |hash, el|
    hash[el] += el.size
    hash
  end
end
p(find_word_lengths(%w[hi there how is everyone]))

#Find word length with each method
def word_length(list)
  hash = {}
  list.each { |w| hash[w] = w.size }
  hash
end
p(word_length(%w[hi there how is everyone]))
