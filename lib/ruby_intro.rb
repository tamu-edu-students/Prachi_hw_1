# frozen_string_literal: true

# Part 1

def sum(arr)
  arr.sum
end

def max_2_sum(arr)
  len = arr.length
  two_sum = 0
  if len == 0
    two_sum = 0
  elsif len == 1
    two_sum = arr[0]
  else
    brr = arr.sort
    two_sum = brr[-1]+brr[-2]
  end
  return two_sum
end

def sum_to_n?(arr, number)
  n = arr.length
  if n <= 1
    return false
  end
  for i in 0..n-2 do
    for j in i+1..n-1 do
      sum2 = arr[i] + arr[j]
      if sum2 == number
        return true
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  a = "Hello, "
  return a+name
end

def starts_with_consonant?(string)
  if string.empty? || (string[0] =~ /[A-Za-z]/ ? true : false) == false
    return false
  else
    return !(['a', 'e', 'i', 'o', 'u'].include? string[0].downcase)
  end
end

def binary_multiple_of_4?(string)
  if string.length == 0
    return false
  end
  
  def binary_to_decimal(string)
    n = string.length-1
    decimal_value = 0
    for i in 0..n do
      if (['0', '1'].include? string[i]) == false
        return false
      end
      power = n-i
      number = (2**power)*Integer(string[i])
      decimal_value+=number
    end
    return decimal_value
  end

  decimal_number = binary_to_decimal(string)
  if decimal_number == false
    return false
  end
  divisible_by_4 = decimal_number%4 == 0
  return divisible_by_4
end

# Part 3

# Object representing a book
class BookInStock
  def initialize(isbn, price)
    raise ArgumentError if isbn.empty?
    raise ArgumentError if price<=0

    @isbn = isbn
    @price = price
  end

  attr_accessor :isbn
  attr_accessor :price

  def price_as_string()
    price_in_decimal = sprintf "%.2f", @price
    price_in_string = "$"+String(price_in_decimal)
    return price_in_string
  end
end
