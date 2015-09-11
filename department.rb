class Department
  attr_reader :name, :employees, :department, :total_salary
  def initialize(name, department: "IT", total_salary: 100000)
    @employees = []
    @name = name
    @department = department
    @total_salary = total_salary
  end

  def assign(employee)
    @employees << employee

  end


end
