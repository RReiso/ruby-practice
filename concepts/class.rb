#Instance variables and class instance variables
class MusicalInstrument
  def self.family
    @family # self: MusicalInstrument class
  end

  def self.set_family
    @family = 'wind instruments'
  end

  def family
    @family # self: instance of MusicalInstrument class
  end

  def set_family
    @family = 'flutes'
  end
end

MusicalInstrument.set_family
new_instrument = MusicalInstrument.new
new_instrument.set_family

p new_instrument.family # flutes
p MusicalInstrument.family # wind instruments

# Defining your '===' method for case statements
class Course
  include Comparable
  attr_accessor :professor, :nr_of_lectures
  def initialize(professor, nr_of_lectures)
    self.professor = professor
    #  @professor
    self.nr_of_lectures = nr_of_lectures
  end

  def ===(other_course)
    self.professor == other_course.professor
    #  @professor
    #  professor
  end

  def <=>(other_course)
    self.nr_of_lectures <=> other_course.nr_of_lectures
    # nr_of_lectures <=> other_course.nr_of_lectures
  end
end
art = Course.new('McArthur', 123)
math = Course.new('Green', 80)
sociology = Course.new('McArthur', 102)

case art
when math
  puts 'Same professor as math!'
when sociology
  puts 'Same professor as sociology!'
else
  puts 'Diffirenet professors'
end

p art > math # true
p art <=> math # 1
