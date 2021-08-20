def sort_colors(nums)
  i = 0
  nums.size.times do
    if nums[i] == 0
      nums.delete_at(i)
      nums.unshift(0)
      i = i + 1
    elsif nums[i] == 2
      nums.delete_at(i)
      nums << 2
    else
      i += 1
    end
  end
end

sort_colors([2, 0, 2, 1, 1, 0])
