Given(/^a new bloom filter$/) do
  @filter = BloomFilter.new
end

Given(/^I add "(.*?)" to the filter$/) do |added_word|
  @filter.add_single_word(added_word)
end

Given(/^a fully loaded bloom filter$/) do
  @filter = BloomFilter.new(1000000)
  @filter.load_file("usa.txt")
end

When(/^I check the filter for "(.*?)"$/) do |checked_word|
  @present = @filter.in_bloom?(checked_word)
end

Then(/^the filter should report it does not exist in my dictionary$/) do
  expect(@present).to eql('no')
end

Then(/^the filter should report it might exist in my dictionary$/) do
  expect(@present).to eql('maybe')
end