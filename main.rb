require 'benchmark'
require "./rand_array"
require "./quicksort"
require "./bubblesort"

def run(algorithm, length, range)
  array = rand_array(length, range)
  puts "input [#{array.join(",")}]"
  case algorithm
  when "quicksort"
    result = Benchmark.measure { quick_sort(array, 0, array.length-1) }
    puts "output [#{array.join(",")}]"
    puts result
  when "bubble sort"
    result = Benchmark.measure { bubble_sort(array) }
    puts "output [#{array.join(",")}]"
    puts result
  else
    puts "no matching algorithm found"
  end
end
