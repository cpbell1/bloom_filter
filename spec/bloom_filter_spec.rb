require 'spec_helper'

describe "Bloom Filter" do
  
    it "should have an empty filter of all zeros" do
      my_bloom_filter = BloomFilter.new               
      expect(my_bloom_filter.filter_contents).to eql(0)
    end
            
    it "should not be zero after adding a word to the filter" do
      my_bloom_filter = BloomFilter.new                      
      my_bloom_filter.add_single_word("developer")          
      expect(my_bloom_filter.filter_contents).not_to eql(0)
    end
    
    it "should be equal to the input word hash after adding only that word to the filter" do
      my_bloom_filter = BloomFilter.new
      expected_filter = 352100620296343613541066344608341732476524205303               
      my_bloom_filter.add_single_word("developer")          
      expect(my_bloom_filter.filter_contents).to eql(expected_filter)
    end

 end
