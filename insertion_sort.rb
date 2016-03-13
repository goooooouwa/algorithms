def insertion_sort(array, p, r)
  for j in p+1..r
    (j-1).downto(p) do |i|
      # puts "#{array[i]} <=> #{array[i+1]}"
      if array[i+1] < array[i]
        t = array[i]
        array[i] = array[i+1]
        array[i+1] = t
        # puts "[#{array.join(",")}]"
      end
    end
  end
  # puts "output array [#{array.join(",")}]"
end
