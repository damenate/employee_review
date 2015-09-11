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
end
