require 'test_helper'

class StringCalculatorTest < Minitest::Spec
  describe '.sum' do
    it 'for an empty string it will return 0' do
      StringCalculator.sum('').must_equal 0
    end

    it 'for one number it will return this number' do
      StringCalculator.sum('15').must_equal 15
    end

    it 'for two numbers it will return his sum' do
      StringCalculator.sum('10,5').must_equal 15
    end

    it 'will return sum of any amount of numbers' do
      StringCalculator.sum('1,2,3,4,5').must_equal 15
    end

    it 'will handle new lines between numbers' do
      StringCalculator.sum("1,\n2,3").must_equal 6
    end

    it 'if string has other delimiter' do
      StringCalculator.sum("//;\n1;2").must_equal 3
    end

    it 'with a negative number will throw an exception' do
      -> { StringCalculator.sum('-5,-10') }.must_raise 'negatives not allowed'
    end

    it 'numbers bigger than 1000 should be ignored' do
      StringCalculator.sum('10010').must_equal 0
      StringCalculator.sum('2,1001').must_equal 2
    end

    it 'Delimiters can be of any length' do
      StringCalculator.sum("//[***]\n1***2***3").must_equal 6
    end

    it 'Allow multiple delimiters' do
      StringCalculator.sum("//[*][%]\n1*2%3").must_equal 6
    end
  end
end
