Feature: Bloom Filters

  In order to improve my spelling while typing
  As a impatient writer
  I want a bloom filter to quickly tell me if a word is not in my dictionary
  
  Scenario: Empty Bloom Filter Reports No Potential Matches 
  
    Given a new bloom filter
    When I check the filter for "developer"
    Then the filter should report it does not exist in my dictionary
    
  Scenario: Bloom Filter Containing 1 Word Reports maybe if checked for that word 

    Given a new bloom filter
    And I add "developer" to the filter
    When I check the filter for "developer"
    Then the filter should report it might exist in my dictionary
  
    
  Scenario: Bloom Filter Containing 1 Word Reports no if checked for any other word 

    Given a new bloom filter
    And I add "developer" to the filter
    When I check the filter for "programmer"
    Then the filter should report it does not exist in my dictionary
	
  Scenario: Fully Loaded Bloom Filter reports maybe if checked for word within it

    Given a fully loaded bloom filter
    When I check the filter for "programmer"
    Then the filter should report it might exist in my dictionary

  Scenario: Fully Loaded Bloom Filter reports no if checked for absent word

    Given a fully loaded bloom filter
    When I check the filter for "xqrt-:?vz"
    Then the filter should report it does not exist in my dictionary

