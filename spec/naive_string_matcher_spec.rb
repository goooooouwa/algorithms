require 'naive_string_matcher'

describe 'naive_string_matcher' do
  let(:text) { 'bacbababacabacababacabab' }
  let(:pattern) { 'ababaca' }
  let(:shifts) { [] }
  let(:expected_shifts) { [4, 14] }
  it 'should find all valid shifts for the pattern in the text' do
    naive_string_matcher(text,pattern,shifts)
    expect(shifts).to match_array(expected_shifts)
  end
end