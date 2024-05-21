# frozen_string_literal: true

# Class representing a simple string calculator.
class StringCalculator
  MAXIMUM_NUMBER = 1000
  # Adds the numbers provided in the input string.
  #
  # @param numbers [String] A string containing comma-separated numbers.
  # @return [Integer] The sum of the numbers.
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    numbers_array = parse_input(numbers, delimiter)
    validate_numbers(numbers_array)

    numbers_array.reject! { |num| num > MAXIMUM_NUMBER }

    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = ','
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..]
    end
    [delimiter, numbers]
  end

  def parse_input(numbers, delimiter)
    numbers.split(/#{delimiter}|\n/).map(&:to_i)
  end

  def validate_numbers(numbers_array)
    negative_numbers = numbers_array.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?
  end
end
