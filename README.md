# Ruby XML Parsing Gems Benchmark

This small project uses the `benchmark` gem to capture response times for the routines that parse large XML files.

The file was produced in Jmeter Performance Testing tool and it contains *1.5M lines* and it is *51MB* in size.

* **Gems Tested** 
  - Nokogiri
  - Ox

* **Methods Tested** 
  - In Memory and locate element
  - Full document SAX Reader

```ruby
n=10
Benchmark.bm(9) do |x|
  x.report("nokogiri:")   { n.times do ; doc1.xpath("//httpSample").size; end }
  x.report("ox:") { n.times do   ; doc2.locate("*/httpSample").size; end }
end