class Employee
  attr_reader :name, :salary, :phone, :email
  def initialize(name: "Jim", salary: 1000, phone: "123-4567", email: "example@email.com")
    @name = name
    @salary = salary
    @phone = phone
    @email = email
  end

end
