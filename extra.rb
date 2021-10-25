def move_zeroes(nums)
  last_non_zero_index = 0
  nums.each_with_index do |num, index|
    unless num.zero?
      # swap ,moving forward all nonzero numbers
      nums[last_non_zero_index], nums[index] =
        nums[index], nums[last_non_zero_index]
      last_non_zero_index += 1
    end
    p nums
  end
end
move_zeroes([0, 1, 0, 3, 12])

# Binary tree zig zag
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] unless root

  ans = []
  q = []
  q << root
  q << nil
  level_list = []
  is_order_left = true

  until q.empty?
    cur = q.shift
    if cur
      # add val to level list
      is_order_left ? level_list.push(cur.val) : level_list.unshift(cur.val)

      # add children to queue
      q.push(cur.left) if cur.left
      q.push(cur.right) if cur.right
    else
      # finish scan of the level
      ans << level_list
      level_list = []

      unless q.empty?
        q.push(nil)
        is_order_left = !is_order_left
      end
    end
  end
  ans
end

def aba(str, num)
  num.times do
    arr = str.split('')
    even_c = []
    odd_c = []
    arr.each_with_index do |c, i|
      even_c << c if i.even?
      odd_c << c if i.odd?
    end
    str = odd_c.join + even_c.join
  end
  str
end

# cut string two parts
# split chars into two arrs
# prevstr =[]
# lopp through odd chars - i=1,prevstr[i]=char, i+2
# lopp through even chars - i=0,prevstr[i]=char, i+2
# prevstr.join

p aba('012345', 2)
