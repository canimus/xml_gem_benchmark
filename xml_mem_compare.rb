require 'benchmark'
require 'nokogiri'
require 'ox'
require 'colorize'

# This file contains a Jmeter Performance Test Result
# it contains 1.5M lines and is 51MB
source_file = "test_file.xml"


doc1 = Nokogiri::XML(File.open(source_file)); nil
doc2 = Ox.load_file(source_file);nil

puts "Testing Memory XML Parser".colorize(:magenta)
puts "==========================\n"

n=10
Benchmark.bm(9) do |x|
  x.report("nokogiri:")   { n.times do ; doc1.xpath("//httpSample").size; end }
  x.report("ox:") { n.times do   ; doc2.locate("*/httpSample").size; end }
end

puts "Test Completed: " + "OK".colorize(:green)