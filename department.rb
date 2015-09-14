class Department
  attr_reader :name, :employees, :department, :total_salary
  attr_accessor :salary
  def initialize(name, department: "IT", total_salary: 100000)
    @employees = []
    @name = name
    @department = department
    @total_salary = 100000
  end

  def assign(employee)
    @employees << employee
  end

  def add_dept_salary
    @employees.inject(0) {|sum, employee| sum + employee.salary}
  end

  def dept_raise(raise_money)
    deserving = []
      @employees.each do |employee|
        if employee.performance == "amazeballs"
          deserving << employee
        end
      end
      @employees.each do |employee|
        if employee.performance == "amazeballs"
      employee.get_money(raise_money/desrving.length)
      end
    end
  end

  def block_dept_raise(raise_money)
     deserving = []
     @employees.each do |employee|
       if yield(employee)
         deserving << employee
       end
     end
     @employees.each do |employee|
       if yield(employee)
         employee.get_money(raise_money/deserving.length)
       end
     end
   end
end
