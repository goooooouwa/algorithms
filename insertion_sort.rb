require './my_logger'

def insertion_sort(array, p, r)
  for j in p+1..r
    (j-1).downto(p) do |i|
      MyLogger.instance.logger.debug "#{array[i]} <=> #{array[i+1]}"
      if array[i+1] < array[i]
        t = array[i]
        array[i] = array[i+1]
        array[i+1] = t
        MyLogger.instance.logger.debug "[#{array.join(',')}]"
      end
    end
  end
  MyLogger.instance.logger.debug "output array [#{array.join(',')}]"
end
