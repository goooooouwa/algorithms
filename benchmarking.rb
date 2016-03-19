require 'benchmark'
require 'bubble_sort'
require 'counting_sort'
require 'insertion_sort'
require 'merge_sort'
require 'quick_sort'
require 'radix_sort'
require 'rand_array'
require 'randomized_select'

def stress
  Benchmark.bm do |x|
    ['rand','sorted'].each do |t|
      i = 10
      while i <= 10000
        array = send("#{t}_array", i)
        x.report('%-21s with %-6d %6s items:' %['bubble_sort', i, t]) { bubble_sort(Array.new(array)) } # O(n^2)
        x.report('%-21s with %-6d %6s items:' %['insertion_sort',i,t]) { insertion_sort(Array.new(array)) } # O(n^2)
        x.report('%-21s with %-6d %6s items:' %['merge_sort',i,t]) { merge_sort(Array.new(array),0,array.length-1) } # O(n*lgn)
        x.report('%-21s with %-6d %6s items:' %['quick_sort',i,t]) { quick_sort(Array.new(array),0,array.length-1) } # rand: O(n*lgn), sorted: O(n^2)
        x.report('%-21s with %-6d %6s items:' %['randomized_quick_sort',i,t]) { randomized_quick_sort(Array.new(array),0,array.length-1) } # O(n*lgn)
        x.report('%-21s with %-6d %6s items:' %['counting_sort',i,t]) { counting_sort(Array.new(array),array.length) } # O(n)
        x.report('%-21s with %-6d %6s items:' %['radix_sort',i,t]) { radix_sort(Array.new(array),Math.log10(i)+1) } # O(n)
        x.report('%-21s with %-6d %6s items:' %['randomized_select',i,t]) { randomized_select(Array.new(array),0,array.length-1,5) } # O(n)
        i *= 10
      end
    end
  end
end
