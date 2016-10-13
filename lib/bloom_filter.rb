require 'digest/sha2'

class BloomFilter
  
  @bloom_filter
  @filter_size
  
  def initialize(filter_size=512)
    @filter_size = filter_size
    @bloom_filter = Array.new(@filter_size)
    @bloom_filter.each do |index|
      index = false
    end
  end
  
  def add_single_word(added_word)
    added_word = added_word.downcase
    hashed_word = Digest::SHA512.hexdigest(added_word)
    bloom_index = hashed_word.to_i(16) % @filter_size
    @bloom_filter[bloom_index] = true
  end
  
  def load_file(loaded_file)
    File.expand_path('../..')
    File.open(loaded_file, mode="r").each do |line|
      add_single_word(line.strip)
    end
  end
  
  def in_bloom?(checked_word)
    checked_word = checked_word.downcase
    hashed_word = Digest::SHA512.hexdigest(checked_word)
    bloom_index = hashed_word.to_i(16) % @filter_size
    if (@bloom_filter[bloom_index] == true)
      'maybe'
    else
      'no'
    end
  end
  
  def empty?
    is_empty = true
    @bloom_filter.each do |index|
      if (index == true)
        is_empty = false
        break
      end
    end
    is_empty
  end
  
end