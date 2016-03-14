require 'benchmark'
require "./rand_array"
require "./quick_sort"
require "./bubble_sort"
require "./merge_sort"
require "./insertion_sort"

def run(algorithm)
  sorted_array = [1,2,3,4,5]
  reverse_sorted_array = [5,4,3,2,1]
  same_keys_array = [0,0,0,1,1,1]
  sizes = [1000, 10000, 100000]
  Benchmark.bm do |x|
    x.report("sorted array:") { send(algorithm, sorted_array, 0, sorted_array.length-1) }
    x.report("reverse sorted array:") { send(algorithm, reverse_sorted_array, 0, reverse_sorted_array.length-1) }
    x.report("same keys array:") { send(algorithm, same_keys_array, 0, same_keys_array.length-1) }
    for i in sizes
      x.report("#{i} keys array:") { send(algorithm, rand_array(i, i), 0, i-1) }
    end
  end
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
