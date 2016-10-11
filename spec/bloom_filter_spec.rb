require 'spec_helper'

describe "Bloom Filter" do
  
  let(:my_bloom_filter)   {BloomFilter.new}
  let(:developer_hash)    {352100620296343613541066344608341732476524205303}

  describe "initializing filter" do
          
    it "should have an empty filter of all zeros" do
      expect(my_bloom_filter.filter_contents).to eql(0)
    end
  end
  
  describe "adding words to filter" do
             
    it "should not be zero after adding a word to the filter" do
      my_bloom_filter.add_single_word("developer")          
      expect(my_bloom_filter.filter_contents).not_to eql(0)
    end
    
    it "should be equal to the input word hash after adding only that word to the filter" do
      my_bloom_filter.add_single_word("developer")          
      expect(my_bloom_filter.filter_contents).to eql(developer_hash)
    end    
  end
  
  

 end
