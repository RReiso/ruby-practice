def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end

p find_outlier([1,1,1,1,1,1,2,1,5])

def find_outlier(integers)
  block = integers.one?(&:even?) ? :even? : :odd?
  integers.find(&block)
end

def find_outlier(integers)
  (0..Float::INFINITY).each do |i|

    num1 = integers[i].even?
    num2 = integers[i+1].even?
    num3 = integers[i+2].even?

    next if (num1 == num2 && num2 == num3)

    if num1 == num2
      return integers[i+2]
    elsif num1 == num3
      return integers[i+1]
    else
      return integers[i]
    end
  end
end

p find_outlier([1,1,1,1,1,1,4,1,5])