require 'digest/sha1'

class BloomFilter
  
  @bloom_filter
  
  def initialize
    @bloom_filter = 0
  end
  
  def add_single_word(added_word)
    added_word = added_word.downcase
    hashed_word = Digest::SHA1.hexdigest(added_word)
    @bloom_filter = @bloom_filter | hashed_word.to_i(16)
  end
  
  def load_file(loaded_file)
    File.expand_path('../..')
    File.open(loaded_file, mode="r").each do |line|
      add_single_word(line.strip)
    end
  end
  
  def in_bloom?(checked_word)
    checked_word = checked_word.downcase
    hashed_word = Digest::SHA1.hexdigest(checked_word).to_i(16)
    search_result = @bloom_filter & hashed_word
    if (search_result == hashed_word)
      'maybe'
    else
      'no'
    end
  end
  
  def filter_contents
    @bloom_filter
  end
  
end