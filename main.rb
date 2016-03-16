require 'benchmark'
require './lib/my_logger'
require './lib/rand_array'
require './lib/quick_sort'
require './lib/bubble_sort'
require './lib/merge_sort'
require './lib/insertion_sort'

def run(algorithm)
  sizes = [100, 1000, 10000]
  Benchmark.bm do |x|
    for i in sizes
      x.report("#{i} items:") { send(algorithm, rand_array(i, i), 0, i-1) }
    end
  end
end

def run_all(length)
  algorithms = %w(quick_sort, merge_sort, insertion_sort, bubble_sort)
  array = rand_array(length, length*10)
  MyLogger.instance.logger.debug "input [#{array.join(',')}]"
  Benchmark.bm do |x|
    algorithms.each do |algorithm|
      x.report("#{algorithm}:") { send(algorithm, Array.new(array), 0, array.length-1) }
    end
  end
end
