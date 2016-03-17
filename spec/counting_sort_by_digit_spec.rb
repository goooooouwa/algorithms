require 'benchmark'
require 'rand_array'
require 'counting_sort_by_digit'

describe '#radix_sort' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      radix_sort(array,1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should sort the array' do
      radix_sort(array,1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should sort the array' do
      radix_sort(array,1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains 2-digit items' do
    let(:array) { [10,21,11,20,10,21] }
    let(:array_sorted) {[10,10,11,20,21,21]}
    it 'should sort the array' do
      radix_sort(array,2)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'when the array contains 100000 random items' do
    let(:size) { 100000 }
    it 'should sort it within 100ms' do
      result = Benchmark.measure { radix_sort(rand_array(size), 6) }
      expect(result.real).to be < 0.1
    end
  end
end

describe '#counting_sort_by_digit' do
  context 'when the sort digit is the least significant one and the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:digit) { 1 }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the sort digit is the least significant one and the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:digit) { 1 }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the sort digit is the least significant one and the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:digit) { 1 }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the sort digit is the second least significant one and the array contains items with same value' do
    let(:array) { [10,21,11,20,10,21] }
    let(:digit) { 2 }
    let(:array_sorted) {[10,11,10,21,20,21]}
    it 'should return a sorted array' do
      expect(counting_sort_by_digit(array,digit)).to match_array(array_sorted)
    end
  end
  context 'when the array contains 100000 random items' do
    let(:size) { 100000 }
    let(:digit) { 1 }
    it 'should sort it within 100ms' do
      result = Benchmark.measure { counting_sort_by_digit(rand_array(size), digit) }
      expect(result.real).to be < 0.1
    end
  end
end

describe '#get_digit' do
  context 'when digit <= 0' do
    let(:n) { 123 }
    let(:digit) { 0 }
    it 'should raise an ArgumentError' do
      expect{ get_digit(n, digit) }.to raise_error(ArgumentError, 'Digit must be greater than 0')
    end
  end
  context 'when digit = 1' do
    let(:n) { 123 }
    let(:digit) { 1 }
    it 'should return the least significant digit' do
      expect(get_digit(n,digit)).to eq(3)
    end
  end
  context 'when digit > 1' do
    let(:n) { 123 }
    let(:digit) { 3 }
    it 'should return the third least significant digit' do
      expect(get_digit(n,digit)).to eq(1)
    end
  end
end