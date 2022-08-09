require "benchmark/ips"
require "securerandom"
require "rust_uuid"

Benchmark.ips do |x|
  x.report("standard") { SecureRandom.uuid }
  x.report("rust lib") { RustUUID.v4 }
  x.compare!
end
