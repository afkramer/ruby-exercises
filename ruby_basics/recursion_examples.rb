def fact(n)
  n == 1 ? 1 : n * fact(n - 1)
end

# puts "Factorial of 3: #{fact(3)}"

def process_string(word)
  arr = word.downcase.split('')
  letters = []
  arr.each do |letter|
    letters << letter if /[a-z]/.match(letter) 
  end
  print letters
  palindrome?(letters)
end

def palindrome?(word_arr)
  if word_arr.length <= 2
    a = word_arr[0]
    b = word_arr[-1]
    a == b
  else
    a = word_arr.shift
    b = word_arr.pop
    a == b ? palindrome?(word_arr) : false
  end
end

# puts "'Cheese' is a palindrome: #{process_string('Cheese')}"
# puts "'Racecar' is a palindrome: #{process_string('Racecar')}"
# puts "'A nut for a jar of tuna.' is a palindrome: #{process_string('A nut for a jar of tuna.')}"

def bottles_of_beer(n)
  if n.zero?
    puts 'no more bottles of beer on the wall.'
  elsif n == 1
    puts '1 bottle of beer on the wall.'
    bottles_of_beer(n - 1)
  else
    puts "#{n} bottles of beer on the wall."
    bottles_of_beer(n - 1)
  end
end

# bottles_of_beer(4)

def fibonacci(n)
  if n.zero?
    0
  elsif n == 1
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# puts fibonacci(5)
# puts fibonacci(8)

def flat(array, new_array = [])
  puts "Array: #{array}"
  new_array << array unless array.is_a?(Array)
  puts "new_array after step 1: #{new_array}"

  if array.any? { |element| element.is_a?(Array) }
    element = array.shift
    puts "Calling flat on"
    flat(array.shift, new_array)
  else
    array.each { |element| new_array << element }
  end
  new_array
end

def flatten(array, new_array = [])
  new_array << array unless array.is_a?(Array)

  array.each do |element|
    if element.is_a?(Array)
      flatten(element, new_array)
    else
      new_array << element
    end
  end
  new_array
end

# array1 = [[1, 2], [3, 4]]
# print flatten(array1)
# puts
# array2 = [[1, [8, 9]], [3, 4]]
# print flatten(array2)
# puts
# array3 = []
# print flatten(array3)
# puts

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def int_to_roman(roman_mapping, int, numeral = '')
  return numeral if int.zero?

  roman_mapping.each_key do |divisor|
    quotient, modulus = int.divmod(divisor)
    numeral << roman_mapping[divisor] * quotient
    return int_to_roman(roman_mapping, modulus, numeral) if quotient > 0
  end
end

# puts int_to_roman(roman_mapping, 5)
# puts int_to_roman(roman_mapping, 3000)
# puts int_to_roman(roman_mapping, 986)
# puts int_to_roman(roman_mapping, 1974)
# puts int_to_roman(roman_mapping, 2005)

int_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_int(int_mapping, numeral, int = 0)
  return int if numeral == ''

  if int_mapping.key?(numeral[0, 2])
    puts numeral[0, 2]
    int += int_mapping[numeral[0, 2]]
    return roman_to_int(int_mapping, numeral.slice(2..numeral.length), int) if numeral.length > 2
  else
    puts numeral[0]
    int += int_mapping[numeral[0]]
    return roman_to_int(int_mapping, numeral.slice(1..numeral.length), int) if numeral.length > 1
  end
  int
end

puts roman_to_int(int_mapping, 'V')
puts roman_to_int(int_mapping, 'MMM')
puts roman_to_int(int_mapping, 'CMLXXXVI')
puts roman_to_int(int_mapping, 'MCMLXXIV')
puts roman_to_int(int_mapping, 'MMV')
