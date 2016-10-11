require 'spec_helper'

describe "Bloom Filter" do
  
    it "should have an empty filter of all zeros" do
      my_bloom_filter = BloomFilter.new               
      expect(my_bloom_filter.filter_contents).to eql(0)
    end

 end
