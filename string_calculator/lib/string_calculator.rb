# lib/string_calculator.rb
class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])
      numbers = parts[1]
    end

    num_array = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = num_array.select { |n| n < 0 }
    
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    num_array.sum
  end
  
end
