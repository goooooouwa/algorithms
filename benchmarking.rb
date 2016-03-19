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
    i = 10
    while i <= 10000
      ['rand','sorted'].each do |t|
        array = send("#{t}_array",i)
        x.report('%-21s with %-6d %6s items:' %['bubble_sort',i,t]) { bubble_sort(array) }
        x.report('%-21s with %-6d %6s items:' %['counting_sort',i,t]) { counting_sort(array,array.length) }
        x.report('%-21s with %-6d %6s items:' %['insertion_sort',i,t]) { insertion_sort(array) }
        x.report('%-21s with %-6d %6s items:' %['merge_sort',i,t]) { merge_sort(array,0,array.length-1) }
        x.report('%-21s with %-6d %6s items:' %['quick_sort',i,t]) { quick_sort(array,0,array.length-1) }
        x.report('%-21s with %-6d %6s items:' %['randomized_quick_sort',i,t]) { randomized_quick_sort(array,0,array.length-1) }
        x.report('%-21s with %-6d %6s items:' %['radix_sort',i,t]) { radix_sort(array,Math.log10(i)+1) }
        x.report('%-21s with %-6d %6s items:' %['randomized_select',i,t]) { randomized_select(array,0,array.length-1,5) }
      end
      i *= 10
    end
  end
end
