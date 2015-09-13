class Employee
  attr_reader :reviews, :name, :salary, :phone, :email, :preformance
  def initialize(name: "Jim", salary: 1000, phone: "123-4567", email: "example@email.com", review: "")
    @name = name
    @salary = salary
    @phone = phone
    @email = email
    @reviews = []
    @preformance = "Use only amazeballs or worthless!"
    @good_employee = []
    @bad_employee = []
  end

  def reviews(message)
    @reviews << message
    @reviews
  end

  def add_all_salaries
    @employees.inject(0) {|sum, employee| sum + employee.salary}
  end

  def grade(input)
    if input == "amazeballs"
      @preformance = true
    elsif input == "worthless"
      @preformance = false
    else
      puts "Use only amazeballs or worthless!"
    end
  end

  def get_money(raise_money)
    @salary += raise_money
  end















end
