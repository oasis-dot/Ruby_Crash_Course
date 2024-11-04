require 'date'
class Student
  attr_accessor :surname, :name
  @@students = []
  def initialize(surname, name, date_of_birth)
    raise ArgumentError, "Birth date must be a Date object" unless date_of_birth.is_a?(Date)
    @surname = surname
    @name = name
    self.date_of_birth = date_of_birth
    add_student
  end

  def self.students
    @@students
  end

  def self.students=(students)
    @@students = students
  end

  def date_of_birth=(date_of_birth)
    if date_of_birth >= Date.today
      raise ArgumentError.new("Birth date must be in the past")
    end
    @date_of_birth = date_of_birth
  end
  def date_of_birth
    @date_of_birth
  end

  def self.student_exists?(surname, name, date_of_birth)
    @@students.any? {|student| student.surname == surname && student.name == name && student.date_of_birth == date_of_birth}
  end

  def calculate_age
    today = Date.today
    age = today.year - @date_of_birth.year
    age -= 1 if (today.month < @date_of_birth.month) || (today.month == @date_of_birth.month && today.day < @date_of_birth.day)
    age
  end
  

  def add_student
    raise ArgumentError, "This student already exists" if @@students.any? { |s| s.name == name && s.surname == surname && s.date_of_birth == date_of_birth }
    @@students << self
  end

  def self.remove_student(surname, name, date_of_birth)
    @@students.delete_if { |student| student.surname == surname && student.name == name && student.date_of_birth == date_of_birth }
  end

  def self.get_students_by_age(age)
    raise ArgumentError, "Needs to be Integer" unless age.is_a?(Integer)
    @@students.select {|student| student.calculate_age == age}
  end
  
  def self.get_students_by_name(name)
    raise ArgumentError, "Needs to be String" unless name.is_a?(String)
    @@students.select {|student| student.name == name}
  end
end
