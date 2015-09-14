class Employee
  attr_reader :reviews, :name, :phone, :email
  attr_accessor :salary, :performance
  def initialize(name: "Jim", salary: 1000, phone: "123-4567", email: "example@email.com", review: "")
    @name = name
    @salary = salary
    @phone = phone
    @email = email
    @reviews = []
    @performance = "Use only amazeballs or worthless!"
    @good_employee = []
    @bad_employee = []
  end

  def reviews(message)
    @reviews << message
    @reviews
  end

  def grade(input)
    if input == "amazeballs"
      @performance = true
    elsif input == "worthless"
      @performance = false
    else
      puts "Use only amazeballs or worthless!"
    end
  end

  def get_money(raise_money)
    @salary += raise_money
  end


end
