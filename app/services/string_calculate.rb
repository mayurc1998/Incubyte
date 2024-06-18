# app/services/string_calculator.rb
class StringCalculate
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers[2..].split("\n", 2)
      delimiters << custom_delimiter
    end

    num_list = numbers.split(Regexp.union(delimiters))
    negatives = num_list.select { |num| num.to_i.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    num_list.map(&:to_i).sum
  end
end
