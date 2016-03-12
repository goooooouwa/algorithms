require "./rand_array"
require "./quicksort"
require "./bubblesort"

def run(length, range)
  array = rand_array(length, range)
  puts "[#{array.join(",")}]"
  # quick_sort(array, 0, array.length-1)
  bubble_sort(array)
  puts "[#{array.join(",")}]"
end
