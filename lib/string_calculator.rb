# String Calculator
class StringCalculator
  MAX_VALUE = 1000
  def self.sum(numbers)
    numbers = numbers.split(/[^\d\-]+/).map(&:to_i)
    negative_numbers = []
    numbers.each_index do |i|
      negative_numbers << numbers[i] if numbers[i] < 0
      numbers[i] = 0 if numbers[i] > MAX_VALUE
    end

    raise "negatives not allowed: #{negative_numbers}" if negative_numbers.any?

    result = numbers.inject(:+)
    result = 0 if result.nil?
    result
  end
end
