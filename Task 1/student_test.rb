require_relative "student.rb"

student1 = Student.new("Rudyk", "Max", 2000, 8, 11)
student2 = Student.new("Smith", "John", 1999, 5, 20)
student3 = Student.new("Johnson", "Mike", 2001, 3, 15)
student4 = Student.new("Brown", "Emily", 2002, 12, 30)
student5 = Student.new("Davis", "Olivia", 1998, 7, 25)

puts "Calculate age for John Smith"
p student2.calculate_age
puts "-------------"

puts "List of all students"
p Student.students_array
puts "-------------"

puts "Get student with age 23"
p Student.get_students_by_age(23)
puts "-------------"

puts "Get student with name 'Mike'"
p Student.get_students_by_name("Mike")