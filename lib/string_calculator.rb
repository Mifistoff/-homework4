# String Calculator
class StringCalculator
  MAX_VALUE = 1000
  ZERO = 0
  def self.sum(numbers)
    numbers = numbers.split(/[^\d\-]+/).map(&:to_i)
    negative_numbers = []
    numbers.each_index do |i|
      negative_numbers << numbers[i] if numbers[i] < ZERO
      numbers[i] = ZERO if numbers[i] > MAX_VALUE
    end

    raise "negatives not allowed: #{negative_numbers}" if negative_numbers.any?

    result = numbers.inject(:+)
    result = ZERO if result.nil?
    result
  end
end
