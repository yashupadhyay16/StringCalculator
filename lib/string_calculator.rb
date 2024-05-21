# frozen_string_literal: true

# Class representing a simple string calculator.
class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2], numbers.split("\n", 2).last
    end

    numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i).sum
  end
end