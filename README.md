# Ruby XML Parsing Gems Benchmark

## Contents

This small project uses the `benchmark` gem to capture response times for the routines that parse large XML files.

* **Gems Testeed** 
  - Nokogiri
  - Ox

```ruby
n=10
Benchmark.bm(9) do |x|
  x.report("nokogiri:")   { n.times do ; doc1.xpath("//httpSample").size; end }
  x.report("ox:") { n.times do   ; doc2.locate("*/httpSample").size; end }
end
```ruby