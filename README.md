# Ruby XML Parsing Gems Benchmark

This small project uses the `benchmark` gem to capture response times for the routines that parse large XML files.

The file was produced in Jmeter Performance Testing tool and it contains *1.5M lines* and it is *51MB* in size.

## Configuration
- File Lines: **1'480,634 lines**
- File Size: **51MB**
- MacBook Pro (Retina, 13-inch, Late 2013)
- Processor: 2.4 GHz Intel Core i5
- Memory: 8 GB 1600 MHz DDR3

*Gems Tested*
    - Nokogiri
    - Ox

*Methods Tested* 
  - In Memory and locate element
  - Full document SAX Reader

```bash
#ruby xml_mem_compare.rb 
Testing Memory XML Parser
==========================
                user     system      total        real
nokogiri:   1.040000   0.010000   1.050000 (  1.044546)
ox:        36.090000   0.180000  36.270000 ( 36.413217)
Test Completed: OK
#

```ruby
n=10
Benchmark.bm(9) do |x|
  x.report("nokogiri:")   { n.times do ; doc1.xpath("//httpSample").size; end }
  x.report("ox:") { n.times do   ; doc2.locate("*/httpSample").size; end }
end