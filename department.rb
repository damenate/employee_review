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

  def dept_raise(raise_money)
    deserve = @employees.reject {|employee| employee.preformance == false}
    total_raise = (raise_money/deserve.length)
    for employee in @employees
       if employee.preformance == true then
         employee.salary += total_raise
       end
    end
  end

end
