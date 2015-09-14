require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews.rb'
require 'byebug'

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
    assert employee
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
  end

  def test_department_total_salary
    department = Department.new("IT")
    employee = Employee.new({name: "Jake", salary: 100000, phone: "123-345-567", email: "jake@aol.com"})
    department.assign(employee)
    assert 100000 == department.add_dept_salary
  end

  def test_employee_reviews_text
    employee = Employee.new(name: "Jake")
    message = "Jake has been essential in keeping this company afloat. He is an instrumental key
    in our IT department and has shown excellent leadership skills. He not only works efficiently but
    the quality of his work is impeccible. He has been working with us for six years now and
    'satisfactorly' is quite the understandment when checking the boxes for Jake. Lets give our
    employee of the year, six years running a large raise!"
    assert_equal [message], employee.reviews(message)
  end

  def test_mark_employee_performance
    employee = Employee.new(name: "Jake")
    employee.grade("amazeballs")
    assert employee.performance
    employee.grade("worthless")
    refute employee.performance
  end

  def test_employee_raise
    employee = Employee.new(name: "Jake", salary: 100000)
    assert_equal 150000, employee.get_money(50000)
  end

  def test_department_employee_raises
    employee = Employee.new({name: "Jake", salary: 100000, phone: "123-345-567", email: "jake@aol.com"})
    department = Department.new("IT")
    department.assign(employee)
    employee.reviews("Jake has been essential in keeping this company afloat. He is an instrumental key
    in our IT department and has shown excellent leadership skills. He not only works efficiently but
    the quality of his work is impeccible. He has been working with us for six years now and
    'satisfactorly' is quite the understandment when checking the boxes for Jake. Lets give our
    employee of the year, six years running a large raise!")
    employee.grade("amazeballs")

    employee2 = Employee.new({name: "Mary", salary: 110000, phone: "223-345-567", email: "mary@aol.com"})
    department = Department.new("IT")
    department.assign(employee2)
    employee2.reviews("Mary has been great and the company could not function without her. She is
    the person that makes us run like a well oiled machine. Lets make sure and keep her around.")
    employee2.grade("amazeballs")

    employee3 = Employee.new({name: "Gary", salary: 50000, phone: "323-335-567", email: "gary@aol.com"})
    department = Department.new("IT")
    department.assign(employee3)
    employee3.reviews("Gary is crap. Dont give him a raise and see if you can get him to quit.")
    employee3.grade("worthless")

    department.dept_raise(100000)
    assert_equal 100000, employee.salary
    assert_equal 110000, employee2.salary
    assert_equal 50000, employee3.salary
  end


  def test_departmnet_raise_with_block
    employee = Employee.new({name: "Jake", salary: 100000, phone: "123-345-567", email: "jake@aol.com"})
    department = Department.new("IT")
    department.assign(employee)
    employee.grade("amazeballs")

    employee2 = Employee.new({name: "Mary", salary: 110000, phone: "223-345-567", email: "mary@aol.com"})
    department = Department.new("IT")
    department.assign(employee2)
    employee2.grade("amazeballs")

    employee3 = Employee.new({name: "Gary", salary: 50000, phone: "323-335-567", email: "gary@aol.com"})
    department = Department.new("IT")
    department.assign(employee3)
    employee3.grade("worthless")

    department.block_dept_raise(50000){|employee| employee.performance == "amazeballs"}
    assert_equal 100000, employee.salary
    assert_equal 110000, employee2.salary
    assert_equal 50000, employee3.salary

    department.block_dept_raise(50000){|employee| employee.salary < 100000}
    assert_equal 100000, employee.salary
    assert_equal 110000, employee2.salary
    assert_equal 100000, employee3.salary

    department.block_dept_raise(50000){|employee| employee.salary < 100000}
    assert_equal 100000, employee.salary
    assert_equal 110000, employee2.salary
    assert_equal 100000, employee3.salary

  end
end
