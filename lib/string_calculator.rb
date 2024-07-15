# frozen_string_literal: true

class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
  end
end
