require 'digest/sha1'

class BloomFilter
  
  @bloom_filter
  
  def initialize
    @bloom_filter = 0
  end
  
  def add_single_word(added_word)
    hashed_word = Digest::SHA1.hexdigest(added_word)
    @bloom_filter = @bloom_filter | hashed_word.to_i(16)
  end
  
  def in_bloom?(checked_word)
    'no'
  end
  
  def filter_contents
    @bloom_filter
  end
  
end