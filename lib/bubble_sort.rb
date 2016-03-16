def bubble_sort(array, p, r)
  for i in 1..array.length-1
    for j in 1..array.length-i
      if array[j-1] > array[j]
        t = array[j-1]
        array[j-1] = array[j]
        array[j] = t
      end
    end
  end
end
