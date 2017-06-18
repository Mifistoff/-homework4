# for the second plus

require 'string_calculator'

describe StringCalculator do
  describe '.sum' do
    context 'for an empty string' do
      it 'return 0' do
        expect(StringCalculator.sum('')).to eql(0)
      end
    end

    context 'for one number' do
      it 'will return this number' do
        expect(StringCalculator.sum('15')).to eql(15)
      end
    end

    context 'for two numbers' do
      it 'will return his sum' do
        expect(StringCalculator.sum('10,5')).to eql(15)
      end
    end

    context 'for any amount of numbers' do
      it 'will return his sum' do
        expect(StringCalculator.sum('1,2,3,4,5')).to eql(15)
      end
    end

    context 'for a negative number' do
      it 'will throw an exception' do
        expect do
          -> { StringCalculator.sum('-5,-10') }.to raise 'negatives not allowed'
        end
      end
    end

    context 'numbers bigger than 1000' do
      it 'should be ignored' do
        expect(StringCalculator.sum('10010')).to eql(0)
        expect(StringCalculator.sum('2,1001')).to eql(2)
      end
    end

    context 'for delimiters' do
      it 'will handle new lines between numbers' do
        expect(StringCalculator.sum("1,\n2,3")).to eql(6)
      end
      it 'allow multiple delimiters' do
        expect(StringCalculator.sum("//[*][%]\n1*2%3")).to eql(6)
      end
      it 'can be of any length' do
        expect(StringCalculator.sum("//[***]\n1***2***3")).to eql(6)
      end
      it 'will handle other delimiter' do
        expect(StringCalculator.sum("//;\n1;2")).to eql(3)
      end
    end
  end
end
