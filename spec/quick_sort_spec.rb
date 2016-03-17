require 'benchmark'
require 'rand_array'
require 'quick_sort'

describe '#quick_sort' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      quick_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      quick_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should sort the array' do
      quick_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains 10000 random items' do
    let(:size) { 10000 }
    it 'should sort it within 100ms' do
      result = Benchmark.measure { quick_sort(rand_array(size), 0, size-1) }
      expect(result.real).to be < 0.1
    end
  end
end