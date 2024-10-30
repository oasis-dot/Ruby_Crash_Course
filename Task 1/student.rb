require 'date'
class Student
  attr_accessor :surname, :name, :date_of_birth
  @@students = []
  def initialize(surname, name, year, month, day)
    raise ArgumentError, "Date of birth is not valid" if Date.new(year, month, day) >= Date.today
    raise StandardError, "This Student already exists" if student_exists?(surname, name, year, month, day)
    @surname = surname
    @name = name
    @date_of_birth = Date.new(year, month, day)
    self.add_student
  end

  def self.students_array
    @@students
  end

  def student_exists?(surname, name, year, month, day)
    @@students.any? {|student| student.surname == surname && student.name == name && student.date_of_birth == Date.new(year, month, day)}
  end

  def calculate_age
    the_date = Time.now
    if the_date.month < @date_of_birth.month or (the_date.month == @date_of_birth.month and the_date.day < @date_of_birth.day )
      the_date.year - @date_of_birth.year - 1
    else
      the_date.year - @date_of_birth.year
    end
  end

  def add_student
    @@students << self
  end

  def remove_student
    @@students.delete(self)
  end

  def self.get_students_by_age(age)
    @@students.select {|student| student.calculate_age == age}
  end
  def self.get_students_by_name(name)
    @@students.select {|student| student.name == name}
  end
end
