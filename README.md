# String calculator

String calculator is a simple Ruby class that allows you to perform addition on strings containing comma-separated numbers.

## Features

- Add numbers from a string
- Support for custom delimiters
- Handle new lines between numbers
- Raise an error for negative numbers

## Usage

### Installation

Clone the repository:

```bash
git clone https://github.com/yashupadhyay16/StringCalculator.git
cd StringCalculator
```

**Usage Example**
  ```example
  require_relative 'string_calculator'
  calculator = StringCalculator.new
  puts calculator.add('1,2,3') # Output: 6
  ```

**Custom Delimiters**

 You can specify custom delimiters using the following syntax:

```bash
puts calculator.add("//;\n1;2;3") # Output: 6
```

**Handling New Lines**

New lines between numbers are also supported:

```bash
puts calculator.add("1\n2,3") # Output: 6
```

**Handling Negative Numbers**

Attempting to add negative numbers will raise an ArgumentError:

```bash
calculator.add('1,-2,3,-4') # Raises ArgumentError: Negative numbers not allowed: -2, -4
```
# Running Tests

Install RSpec if you haven't already:

```bundle
gem install rspec
```

Then, run the tests:

```rspec
rspec
```