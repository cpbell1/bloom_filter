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
  
  describe "checking for words in filter when only one loaded" do
             
    it "should not find a word absent from filter" do
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('no')
    end
    
    it "should find a word present in filter" do
      my_bloom_filter.add_single_word("developer") 
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('maybe')
    end
  end
  
  describe "checking for words in filter when multiple words loaded" do
    it "should not find a word present in filter" do
      my_bloom_filter.add_single_word("developer") 
      my_bloom_filter.add_single_word("programmer")
      my_bloom_filter.add_single_word("coach")      
      found_word = my_bloom_filter.in_bloom?("analyst")         
      expect(found_word).to eql('no')
    end
             
    it "should find a word present in filter" do
      my_bloom_filter.add_single_word("developer") 
      my_bloom_filter.add_single_word("programmer")
      my_bloom_filter.add_single_word("coach")      
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('maybe')
    end
  end
  
  describe "checking for words in filter" do
             
    it "should match upper case word to lower case word in filter" do
      my_bloom_filter.add_single_word("developer") 
      found_word = my_bloom_filter.in_bloom?("DEVELOPER")         
      expect(found_word).to eql('maybe')
    end  
             
    it "should match lower case word to upper case word loaded into filter" do
      my_bloom_filter.add_single_word("DEVELOPER") 
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('maybe')
    end  
  end

end
