# frozen_string_literal: true

require "minitest/autorun"
require "minitest/spec"
require_relative 'test_helper'
require_relative "../app/student"



describe Student do
  before do
    Student.students = []
    @student = Student.new("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))
  end
  
  it "#calculate_age" do
    expect(@student.calculate_age).must_equal 0
  end
  
  it "#find student in array" do
    expect(Student.students).must_be_kind_of Array
    expect(Student.student_exists?("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))).must_equal true
    expect(Student.student_exists?("Name", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))).must_equal false
  end

  it "#remove student" do
  Student.remove_student("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1))
  _(Student.students).must_be_empty
  end

  it "#get student by age" do
  expect { Student.get_students_by_age("string") }.must_raise ArgumentError
  _(Student.get_students_by_age(@student.calculate_age)).must_include @student
  end

  it "#get student by name" do
  expect {Student.get_students_by_name(25)}.must_raise ArgumentError
  _(Student.get_students_by_name(@student.name)).must_include @student

  end


end

describe "negative tests" do
  let(:student) { Student.new("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day - 1)) }
  
  it "#must raise error for setting today date for birth date of student" do
    expect { Student.new("SurName", "LastName", Date.new(Date.today.year, Date.today.month, Date.today.day)) }.must_raise ArgumentError
  end

  it "#must raise error when type of date of birth is not a date" do
    expect {Student.new("SurName", "LastName", 2020)}.must_raise ArgumentError

  end

  it "#must raise error when add student that exist" do
  expect {student.add_student}.must_raise ArgumentError
  end
  after do
    Student.students = []
    end
end



