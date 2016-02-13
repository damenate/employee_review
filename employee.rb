class Employee
  attr_reader :reviews, :name, :phone, :email
  attr_accessor :salary, :performance
  def initialize(name: "", salary: 1000, phone: "", email: "", review: "")
    @name = name
    @salary = salary
    @phone = phone
    @email = email
    @reviews = []
    @performance = false
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


    def reviews(input)
      @reviews << input
      counter = 0
      positive = []
      p_words = ["asset", "happy", "perfect", "devote", "positive", "good", "great", "enjoy", "help others", "excellent", "exceed", "on time", "streamline", "adapt", "strong", "quick", "concise"]
      p_words.each do |word|
        positive = @reviews[-1].scan(/#{word}/i)
        counter += positive.length
      end
      pos_exact_words = []
      p_exact_words = ["satisfied", "consistent", "effective", "pleasure", "willing", "success", "successful", "encourage", "clear", "clearly"]
      p_exact_words.each do |word|
        pos_exact_words = @reviews[-1].scan(/\b#{word}\b/i)
        counter += pos_exact_words.length
      end
      negative = []
      n_words = ["negative", "improvement", "difficult", "confusion", "interrupt", "longer", "inadequate", "issue", "concern", "dwell", "error", "harm", "complaint", "does not", "late", "absence", "attitude", "supervis", "wrong", "however", "lack", "poor"]
      n_words.each do |word|
        negative = @reviews[-1].scan(/\b#{word}\b/i)
        counter -= negative.length
      end
      n_prefixes = []
      neg_prefixes = ["dis", "anti", "non"]# add in if I can get ^ to work
      neg_prefixes.each do |prefix|
        n_prefixes = @reviews[-1].scan(/#{prefix}\w+/i) #\b is what I need, not ^
        counter -= n_prefixes.length
      end
      if counter >= 1
         @performance = true
      elsif counter <= 0
         @performance = false
      else puts "Sorry - this review cannot determine the employee's performance."
      end
    end

end
