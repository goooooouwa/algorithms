require "./counting_sort"

describe "#counting_sort" do
  let(:array_sorted) {[1,2,3,4,5]}
  context "with sorted array" do
    let(:array) { [1,2,3,4,5] }
    it "output sorted array" do
      expect(counting_sort(array,5)).to eq array_sorted
    end
  end
end
