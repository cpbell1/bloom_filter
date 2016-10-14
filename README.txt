The source code is in Ruby ruby 2.1.0p0 , BDD code is in Cucumber 1.3.17 and TDD is in Rspec 3.3.0

Git version 2.3.2 (Apple Git-55)

Platform is a Mac OS 10.10.5 (Yosemite)

This should be compatable with higher versions of Ruby on other platforms, but it has not been tested against it.

If using this Bloom Filter with a real word list (thousands, 10s thousands of words), do not use the default filter size. Instead explicitly set the Bloom Filter size to a good deal larger than the word list.