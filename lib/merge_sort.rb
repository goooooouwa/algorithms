require './lib/my_logger'

def merge_sort(array, p, r)
  if p < r
    array1 = merge_sort(array, p, (r+p)/2)
    array2 = merge_sort(array, (r+p)/2 + 1, r)
    return merge(array1, array2)
  elsif p == r
    return [array[p]]
  end
end

def merge(array1, array2)
  j = 0
  k = 0
  array3 = []
  # sentinel cards
  array1.push 100000000000
  array2.push 100000000000
  (array1.length-1 + array2.length-1).times do
    if array1[j] <= array2[k]
      array3.push array1[j]
      j += 1
    else
      array3.push array2[k]
      k += 1
    end
  end
  MyLogger.instance.logger.debug "after merge [#{array3.join(',')}]"
  return array3
end
