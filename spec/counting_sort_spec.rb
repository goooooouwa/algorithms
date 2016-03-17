require 'benchmark'
require 'rand_array'
require 'counting_sort'

describe '#counting_sort' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should return a sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  context 'when the array contains 100000 random items' do
    let(:size) { 100000 }
    it 'should sort it within 100ms' do
      result = Benchmark.measure { counting_sort(rand_array(size), size) }
      expect(result.real).to be < 0.1
    end
  end
end
