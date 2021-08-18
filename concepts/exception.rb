
def fussy_method(x)
  raise ArgumentError, 'I need a number under 10' unless x < 10 #instances of exception classes are raised (ArgumentError.new)
end

begin
  fussy_method(20)
rescue ArgumentError => e #assign the exception object to variable "e"
  puts 'That was not an acceptable number!'
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message
end