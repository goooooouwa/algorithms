def insertion_sort(array)
  for j in 1..array.length-1
    (j-1).downto(0) do |i|
      if array[i+1] < array[i]
        t = array[i]
        array[i] = array[i+1]
        array[i+1] = t
      end
    end
  end
end
