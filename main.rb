require 'benchmark'
require "./rand_array"
require "./quicksort"
require "./bubblesort"

def run_all(length)
  array = rand_array(length, length*10)
  # puts "input [#{array.join(",")}]"
  Benchmark.bm do |x|
   x.report("quicksort:") { quick_sort(Array.new(array), 0, array.length-1) }
   x.report("bubble sort:") { bubble_sort(Array.new(array)) }
  end
end
