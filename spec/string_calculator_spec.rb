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
  end
end
