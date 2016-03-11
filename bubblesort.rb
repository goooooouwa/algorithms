def bubble_sort(array)
  for j in 0..array.length-2
    for i in j..array.length-2
      if array[i] > array[i+1]
        t = array[i]
        array[i] = array[i+1]
        array[i+1] = t
      end
    end
  end
end

def run
  array = [20,10,13,18,17,15,16,14,1,2,4,7,9,3,8,5,6] #[1,2,4,7,9,3,8,5,6]
  puts array.join(",")
  bubble_sort(array)
  puts array.join(",")
end
