# array[p..r]
def quick_sort(array, p, r)
  if p < r
    q = partition(array, p, r)
    quick_sort(array, p, q-1)
    quick_sort(array, q+1, r)
  end
end

def partition(array, p, r)
  i = p
  puts "pivot #{array[r]}"
  for j in p..r-1
    if array[j] <= array[r]
      t = array[i]
      array[i] = array[j]
      array[j] = t
      puts "#{array[i]} <=> #{array[j]}"
      i += 1
    end
  end
  t = array[i]
  array[i] = array[r]
  array[r] = t
  puts "after partition [#{array.join(",")}]"
  return i
end

def run
  array = [20,10,13,18,17,15,16,14,1,2,4,7,9,3,8,5,6]
  puts "[#{array.join(",")}]"
  quick_sort(array, 0, array.length-1)
  puts "[#{array.join(",")}]"
end
