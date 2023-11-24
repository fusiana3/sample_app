require 'benchmark'
symbol = { :foo => "value" } 
string = { "foo" => "value" }
integer = { 1 => "value" } 
str, sym, num = "foo", :foo, 100

n = 100_000_000
Benchmark.bmbm do |x|
  x.report("Symbol") { n.times { symbol[str] } }
  x.report("String") { n.times { string[str] } }
  x.report("Integer") { n.times { integer[str] } }
end