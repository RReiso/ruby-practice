require "date"
require "time"

p Date.today # #<Date: 2021-07-24 ((2459420j,0s,0n),+0s,2299161j)>
puts Date.today # 2021-07-24

puts Date.new(2002, 3, 28) # 2002-03-28

puts Date.parse("2 Nov 1988") # 1988-11-02

puts Time.new # 2021-07-24 12:27:27 -0400
puts Time.now # 2021-07-24 12:27:27 -0400
time = Time.now
puts time.month
puts time.sec
puts time.saturday?
puts time.strftime("%Y--%m--%d--%A") # 2021--07--24--Saturday
puts time + 20 # adds 20 sec

puts Time.mktime(2008,12,30,2,15,4) # 2008-12-30 02:15:04 -0500
puts Time.local(2008,12,30,2,15,4) # 2008-12-30 02:15:04 -0500

puts Time.parse("April 1, 2009, 22:30") # 2009-04-01 22:30:00 -0400

puts DateTime.new(2010,11,28,21,13,7) # 2010-11-28T21:13:07+00:00
date_time = DateTime.now
puts date_time.year
puts date_time.second
puts date_time + 10 # adds 10 days
puts date_time << 2 # subtracts 2 months
puts date_time.next_year
puts date_time.prev_day
puts date_time.next # next day

