require 'benchmark'
require 'rand_array'
require 'insertion_sort'

describe '#insertion_sort' do
  context 'with sorted array' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      insertion_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'with reverse sorted array' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      insertion_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'with same item array' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should sort the array' do
      insertion_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  it 'should sort 1000 items within 100ms' do
    size = 1000
    result = Benchmark.measure { bubble_sort(rand_array(size, size), 0, size-1) }
    expect(result.real).to be < 0.1
  end
end