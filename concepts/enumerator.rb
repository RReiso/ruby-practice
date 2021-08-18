# Enumerator is a collection, object with a state; not a method, not a container object
p [1,2,3,4,5,6,7,8,9].enum_for(:sort) #<Enumerator: [1, 2, 3, 4, 5, 6, 7, 8, 9]:sort>
p [1,2,3,4,5,6,7,8,9].to_enum(:sort) #<Enumerator: [1, 2, 3, 4, 5, 6, 7, 8, 9]:sort>
p [1,2,3,4,5,6,7,8,9].to_enum #<Enumerator: [1, 2, 3, 4, 5, 6, 7, 8, 9]:each>
p [1,2,3,4,5,6,7,8,9].map #<Enumerator: [1, 2, 3, 4, 5, 6, 7, 8, 9]:map>
p [1,2,3,4,5,6,7,8,9].map.next.next # 2