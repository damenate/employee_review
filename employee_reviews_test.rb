require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews.rb'


class EmployeeReviews < Minitest::Test

  def test_employee_review_classes_exist
    assert Employee
    assert Department
  end

  def test_departmnet_has_name
    department = Department.new("IT")
    assert "IT", department.name
  end

  def test_employee_info
    employee = Employee.new({name: "Jake", salary: 100000, phone: "123-345-567", email: "jake@aol.com"})
  end

  def test_add_employee_to_department
    employee = Employee.new({name: "Jake", salary: 100000, phone: "123-345-567", email: "jake@aol.com"})
    department = Department.new("IT")
    department.assign(employee)
    assert_equal [employee], department.employees
  end

  def test_get_an_employees_info
     employee = Employee.new(name: "Jake")
     assert_equal "Jake", employee.name
     refute_equal "Jim", employee.name
     assert_equal 1000, employee.salary
  end

  def test_get_department_info
    department = Department.new("IT")
    assert_equal "IT", department.name
    refute_equal "Janitorial", department.name
    assert_equal 100000, department.total_salary
  end

  def test_employee_review_text
    assert_equal "Jake has been essential in keeping this company afloat. He is an instrumental key
    in our IT department and has shown excellent leadership skills. He not only works efficiently but
    the quality of his work is impeccible. He has been working with us for six years now and
    'satisfactorly' is quite the understandment when checking the boxes for Jake. Lets give our
    employee of the year, six years running a large raise!"
  end

  def test_mark_if_employee__preformance

  end

  def test_employee_raise

  end

end
