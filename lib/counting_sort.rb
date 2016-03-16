require './lib/my_logger'

def counting_sort(array, k)
  count = Array.new(k+1, 0)
  result = Array.new(array.length)
  # store the number of items equal value in count[value]
  for i in 0..array.length-1
    count[array[i]] += 1
  end
  MyLogger.instance.logger.debug "count [#{count.join(',')}]"
  # store the number of items equal or smaller than value in count[value]
  for i in 1..count.length-1
    count[i] += count[i-1]
  end
  MyLogger.instance.logger.debug "count [#{count.join(',')}]"
  (array.length-1).downto(0) do |j|
    MyLogger.instance.logger.debug "result[#{count[array[j]]-1}] <- array[j]=#{array[j]}"
    result[count[array[j]]-1] = array[j]
    count[array[j]] -= 1
  end
  MyLogger.instance.logger.debug "output [#{result.join(',')}]"
  return result
end
