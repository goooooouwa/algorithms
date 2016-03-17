require 'benchmark'
require 'rand_array'
require 'insertion_sort'

describe '#insertion_sort' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      insertion_sort(array)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      insertion_sort(array)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should sort the array' do
      insertion_sort(array)
      expect(array).to match_array(array_sorted)
    end
  end
  it 'should sort 1000 items within 100ms' do
    size = 1000
    result = Benchmark.measure { insertion_sort(rand_array(size)) }
    expect(result.real).to be < 0.1
  end
end