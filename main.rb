require "./rand_array"
require "./quicksort"

def run
  length = 10
  range = 100
  array = rand_array(length, range)
  puts "[#{array.join(",")}]"
  quick_sort(array, 0, array.length-1)
  puts "[#{array.join(",")}]"
end
