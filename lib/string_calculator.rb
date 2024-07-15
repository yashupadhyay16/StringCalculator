# frozen_string_literal: true

class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i).sum
  end
end
