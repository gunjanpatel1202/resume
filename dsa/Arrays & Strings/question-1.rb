require 'benchmark'

puts "1. How do you reverse an array in Ruby?"


def reverse_array
  array_one = [1, 3, 5, 7, 9]
  array_lenght = array_one.length - 1
  reverse_array = []

  array_one.each_with_index do |element, idx|
    reverse_value = array_one[array_lenght - idx]
    reverse_array.push(reverse_value)
  end
end


puts reverse_array

puts "Large: " + Benchmark.measure { reverse_array }.to_s