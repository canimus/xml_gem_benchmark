require 'benchmark'
require 'nokogiri'
require 'ox'
require 'colorize'


# This file contains a Jmeter Performance Test Result
# it contains 1.5M lines and is 51MB
source_file = "test_file.xml"

class NokoDocSax < Nokogiri::XML::SAX::Document  
  attr_reader :counter
  def initialize
  	@counter = 0
  end  

  def start_element name, attrs = []
    ++@counter if name.eql? "httpSample"
  end
end


class OxDocSax < ::Ox::Sax
  attr_reader :counter
  def initialize
  	@counter = 0
  end
  def start_element(name)
  	++@counter if name.eql? "httpSample"
  end
end


n=10
parser1 = NokoDocSax.new
parser2 = OxDocSax.new

puts "Testing SAX XML Parser".colorize(:magenta)
puts "==========================\n"


Benchmark.bm(9) do |x|
  x.report("nokogiri:")   { n.times do ; Nokogiri::XML::SAX::Parser.new(parser1).parse(File.open(source_file)); end }
  x.report("ox:") { n.times do ; Ox.sax_parse(parser2, File.open(source_file)); end }
end

puts "Test Completed: " + "OK".colorize(:green)