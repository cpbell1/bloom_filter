Feature: Bloom Filters

  In order to improve my spelling while typing
  As a impatient writer
  I want a bloom filter to quickly tell me if a word is not in my dictionary
  
  Scenario: Empty Bloom Filter Reports No Potential Matches 
  
    Given a new bloom filter
    When I check the filter for "developer"
    Then the filter should report it does not exist in my dictionary
    
  Scenario: Bloom Filter Containing 1 Word Reports mayed if checked for that word 

    Given a new bloom filter
    And I add "developer" to the filter
    When I check the filter for "developer"
    Then the filter should report it might exist in my dictionary
  
    
  Scenario: Bloom Filter Containing 1 Word Reports no if checked for any other word 

    Given a new bloom filter
    And I add "developer" to the filter
    When I check the filter for "programmer"
    Then the filter should report it does not exist in my dictionary
