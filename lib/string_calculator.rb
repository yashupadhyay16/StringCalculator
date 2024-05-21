# frozen_string_literal: true
require 'pry'
# Class representing a simple string calculator.
class StringCalculator
  MAXIMUM_NUMBER = 1000

  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    numbers_array = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    
    negative_numbers = numbers_array.select { |num| num.negative? }
    if negative_numbers.any?
      raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}"
    end

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
end