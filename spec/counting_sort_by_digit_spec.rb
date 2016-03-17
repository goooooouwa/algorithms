require 'benchmark'
require 'rand_array'
require 'counting_sort_by_digit'

describe '#counting_sort_by_digit' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:digit) { 1 }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:digit) { 1 }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:digit) { 1 }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  it 'should sort 100000 items within 100ms' do
    size = 100000
    digit = 1
    result = Benchmark.measure { counting_sort_by_digit(rand_array(size), digit) }
    expect(result.real).to be < 0.1
  end
end