require 'spec_helper'

describe "Bloom Filter" do
  
  let(:my_bloom_filter)   {BloomFilter.new}

  describe "initializing filter" do
          
    it "should have an empty filter of all false" do
      expect(my_bloom_filter.empty?).to be true
    end
  end
  
  describe "adding words to filter" do
             
    it "should not be all false after adding a word to the filter" do
      my_bloom_filter.add_single_word("developer")          
      expect(my_bloom_filter.empty?).to be false
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
    it "should not find a word absent from filter" do
      load_three_words
      found_word = my_bloom_filter.in_bloom?("analyst")         
      expect(found_word).to eql('no')
    end
             
    it "should find first word present in filter" do
      load_three_words
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('maybe')
    end

    it "should find second word present in filter" do
      load_three_words
      found_word = my_bloom_filter.in_bloom?("programmer")         
      expect(found_word).to eql('maybe')
    end
    
    it "should find third word present in filter" do
      load_three_words
      found_word = my_bloom_filter.in_bloom?("coach")         
      expect(found_word).to eql('maybe')
    end
  end
  
  describe "checking for case insensitivity in filter" do
             
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
  
  describe "checking for words in filter when small file loaded" do
    it "should not find a word absent from filter" do
      my_bloom_filter.load_file("tiny_dictionary.txt")
      found_word = my_bloom_filter.in_bloom?("analyst")         
      expect(found_word).to eql('no')
    end
             
    it "should find first word present in filter" do
      my_bloom_filter.load_file("tiny_dictionary.txt")
      found_word = my_bloom_filter.in_bloom?("developer")         
      expect(found_word).to eql('maybe')
    end
  end

  describe "checking for words in filter when a file of 305 Australian words loaded" do
    it "should not find a word absent from filter" do
      my_bloom_filter.load_file("305_ausi_words.txt")
      found_word = my_bloom_filter.in_bloom?("American")         
      expect(found_word).to eql('no')
    end
             
    it "should find known word present in filter" do
      my_bloom_filter.load_file("305_ausi_words.txt")
      found_word = my_bloom_filter.in_bloom?("rabbit")         
      expect(found_word).to eql('maybe')
    end
  end
  
  describe "checking for words in filter when 10s of thousands of words loaded" do
    it "should not find a word absent from filter" do
      large_bloom_filter = BloomFilter.new(1000000)
      large_bloom_filter.load_file("33872_word_dictionary.txt")
      found_word = large_bloom_filter.in_bloom?("zzzzzzzzzzzzzzzz")
      expect(found_word).to eql('no')
    end
             
    it "should find known word present in filter" do
      large_bloom_filter = BloomFilter.new(1000000)
      large_bloom_filter.load_file("33872_word_dictionary.txt")
      found_word = large_bloom_filter.in_bloom?("rabbit")         
      expect(found_word).to eql('maybe')
    end
  end

end

def load_three_words
  my_bloom_filter.add_single_word("developer") 
  my_bloom_filter.add_single_word("programmer")
  my_bloom_filter.add_single_word("coach")  
end