require 'benchmark'
require './lib/my_logger'
require './lib/rand_array'
require './lib/quick_sort'
require './lib/bubble_sort'
require './lib/merge_sort'
require './lib/insertion_sort'

def test(algorithm, input_type)
  samples = {
    sorted: [1,2,3,4,5],
    reverse_sorted: [5,4,3,2,1],
    same_keys: [0,0,0,1,1,1],
    randomized: rand_array(10, 100)
  }
  array = samples[input_type.to_sym]
  MyLogger.instance.logger.debug "input [#{array.join(',')}]"
  send(algorithm, array, 0, array.length-1)
end

def test_all(algorithm)
  samples = {
    sorted: [1,2,3,4,5],
    reverse_sorted: [5,4,3,2,1],
    same_keys: [0,0,0,1,1,1],
    randomized: rand_array(10, 100)
  }
  for (type, array) in samples
    puts "#{type}: [#{array.join(',')}]"
    send(algorithm, array, 0, array.length-1)
    puts 'Press ENTER key to continue...'
    gets
  end
end

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
