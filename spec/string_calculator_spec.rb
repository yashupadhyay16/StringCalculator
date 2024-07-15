# frozen_string_literal: true

require './lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    subject(:calculator) { described_class.new }

    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number itself' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'with two numbers' do
      it 'returns the sum' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end

    context 'with multiple numbers separated by comma' do
      it 'returns the sum of all numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end
    end
  end

  describe '#add with new lines' do
    subject(:calculator) { described_class.new }

    context 'with new lines between numbers' do
      it 'returns the sum' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with a custom delimiter' do
      it 'returns the sum' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end
  end

  describe '#add with negatives and large numbers' do
    subject(:calculator) { described_class.new }

    context 'with negative numbers' do
      it 'raises an error' do
        expect { calculator.add('1,-2,3,4') }.to raise_error(ArgumentError, 'Negative numbers not allowed: -2')
      end
    end

    context 'with negative numbers and custom delimiter' do
      it 'raises an error' do
        expect do
          calculator.add('1,-2,3,-4')
        end.to raise_error(ArgumentError, 'Negative numbers not allowed: -2, -4')
      end
    end

    context 'with negative numbers and custom delimiter' do
      it 'raises an error' do
        expect do
          calculator.add("//;\n1;-2;3;-4")
        end.to raise_error(ArgumentError, 'Negative numbers not allowed: -2, -4')
      end
    end
  end
end
