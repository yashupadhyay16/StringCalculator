# frozen_string_literal: true

class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2], numbers.split("\n", 2).last
    end
    
    numbers_array = numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)

    negative_numbers = numbers_array.select { |num| num.negative? }

    if negative_numbers.any?
      raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}"
    end

    numbers_array.sum
  end
end
