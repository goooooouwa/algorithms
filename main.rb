require 'benchmark'
require "./rand_array"
require "./quick_sort"
require "./bubble_sort"
require "./merge_sort"
require "./insertion_sort"

def run(algorithm, length)
  array = rand_array(length, length*10)
  # puts "input [#{array.join(",")}]"
  puts Benchmark.measure { send(algorithm, array, 0, array.length-1) }
end

def run_all(length)
  algorithms = ["quick_sort", "merge_sort", "insertion_sort", "bubble_sort"]
  array = rand_array(length, length*10)
  # puts "input [#{array.join(",")}]"
  Benchmark.bm do |x|
    algorithms.each do |algorithm|
      x.report("#{algorithm}:") { send(algorithm, Array.new(array), 0, array.length-1) }
    end
  end
end
