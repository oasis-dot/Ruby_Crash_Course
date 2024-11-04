# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../app/student'

Minitest::Reporters.use! [
                          # Minitest::Reporters::SpecReporter.new,
                          Minitest::Reporters::HtmlReporter.new(
                             reports_dir: 'Task 2/test/reports/unit',
                             report_filename: 'test_results.html',
                            #  clean: true,
                             add_timestamp: true
                           )
                         ]

class MyTest < Minitest::Test


  def test_calculate_age
    assert_instance_of Integer, @student.calculate_age
    assert_equal(0, @student.calculate_age, "Age of student should be equal to 0")
  end

  def test_raises_error_when_birth_date_today
    assert_raises ArgumentError do
      student = Student.new("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day))
    end
  end

  def test_raises_error_when_type_of_date_of_birth_is_not_date
    assert_raises ArgumentError do
    student = Student.new("SurName", "LastName", 2020)
    end
  end

  def test_raises_error_when_add_student_that_exist
    assert_raises ArgumentError do
      @student.add_student
    end

  end

  def test_student_exists?
    assert_instance_of Array, Student.students
    assert Student.student_exists?("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))
    assert_equal false, Student.student_exists?("Name", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1)), "Student shouldn't be found"
    assert_includes Student.students, @student
  end

  def test_remove_student
    assert_empty Student.remove_student("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))
  end

  def test_get_student_by_age
    assert_raises ArgumentError do
      Student.get_students_by_age("string")
      end
    assert_includes Student.get_students_by_age(@student.calculate_age), @student
  end

  def test_get_student_by_name
    assert_raises ArgumentError do
    Student.get_students_by_name(25)
    end
    assert_includes Student.get_students_by_name(@student.name), @student
  end

  def setup 
    @student = Student.new("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))
  end
  
  def teardown
    Student.students = []
  end
end