require 'benchmark'
require 'rand_array'
require 'bubble_sort'

describe '#bubble_sort' do
  context 'with sorted array' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      bubble_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'with reverse sorted array' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      bubble_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  context 'with same item array' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'output sorted array' do
      bubble_sort(array,0,array.length-1)
      expect(array).to match_array(array_sorted)
    end
  end
  it 'should sort 1000 within 1s' do
    size = 1000
    result = Benchmark.measure { bubble_sort(rand_array(size, size), 0, size-1) }
    expect(result.real).to be < 1
  end
end
